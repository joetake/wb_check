require 'tree_sitter'
require_relative 'classes'
require_relative 'first_path'
require_relative 'second_path'

class Analyzer
  LHS_NIL_RESULT = {type_name: nil, is_pointer_access: false, is_typeddata: false, needWB: false}
  LHS_WB_RESULT = {type_name: nil, is_pointer_access: true, is_typeddata: true, needWB: true}

  def initialize(path_to_source, path_to_parser)
    @path_to_source = path_to_source
    @path_to_parser = path_to_parser
    @wb_list = WriteBarrierList.new
  end
  
  # find rb_check_typeddata()'s node recursively , return found node
  def find_typedthing_call(node, code)
    call = nil
    node.each_named do |child|
      str = code[child.start_byte...child.end_byte]
      if child.named_child_count > 0
      call = find_typedthing_call(child, code)
      end
      if child.type == :call_expression && str.include?('rb_check_typeddata')
        call = child
      end
    end
    return call
  end

  def process_lhs(node, code, vars_in_scope)
    puts node.type
    case node.type
    when :identifier
      name = code[node.start_byte...node.end_byte]
      name.gsub!(/[\(\)\*]/, '')
      puts "name: #{name}"
      cvar = find_cvar(vars_in_scope, name)

      # 一時的！！！
      return LHS_NIL_RESULT if cvar.nil?
      type_name = cvar.type
      if type_name.split(' ').size > 1
        type_name = type_name.split(' ').last
      end
      return {type_name: type_name, is_pointer_access: false, is_typeddata: cvar.is_typeddata, needWB: false}
    when :field_expression
      operator_node = node.child_by_field_name('operator')
      operator = code[operator_node.start_byte...operator_node.end_byte]
      puts operator
      argument = node.child_by_field_name('argument')
      field = node.child_by_field_name('field')
      puts "argument: #{argument}"
      argument_info = process_lhs(argument, code, vars_in_scope)

      unless argument_info[:is_typeddata]
        return LHS_NIL_RESULT
      end

      # check field
      field_info = nil
      if field.type == :field_identifier
        field_name = code[field.start_byte...field.end_byte]
        puts "#{argument_info[:type_name]}, #{field_name}"
        field_cvar = @struct_definitions.find_field(argument_info[:type_name], field_name)
        field_info = {type_name: field_cvar.type, is_pointer_access: false, is_typeddata: false, needWB: false}
      else
        field_info = process_lhs(field, code, vars_in_scope)
        # if field expression in field is needWB: true return immediately
        return field_info if field_info[:needWB]
      end

      expected_access = (operator == '->') || (operator == '.' && argument_info[:is_pointer_access])
      new_type_name = normalize_type_name(field_info[:type_name])
      # check WBneed or not
      if new_type_name == 'VALUE' && expected_access
        return {type_name: 'VALUE', is_pointer_access: true, is_typeddata: false, needWB: true}
      else

        # check struct in field has VALUE element or not
        puts "field_type: #{new_type_name}"
        has_VALUE_element = @struct_definitions.has_VALUE_element?(new_type_name)
        puts "has_VALUE_element?: #{has_VALUE_element}"

        # if it isn't struct or not expected access, return as needWB: false
        unless has_VALUE_element
          return {type_name: new_type_name, is_pointer_access: field_info[:is_pointer_access], is_typeddata: argument_info[:is_typeddata], needWB: false}
        end

        return {type_name: new_type_name, is_pointer_access: true, is_typeddata: true, needWB: true}
      end

    when :pointer_expression
      child = node.child_by_field_name('argument')
      result = process_lhs(child, code, vars_in_scope)
      result[:is_pointer_access] = true
      return result
    when :parenthesized_expression
      inner = node.named_child(0)
      return process_lhs(inner, code, vars_in_scope)

    when :assignment_expression
      inner = node.named_child(1)
      return process_lhs(inner, code, vars_in_scope)
    # when :call_expression, :cast_expression, :binary_expression, :subscript_expression
    #   return LHS_NIL_RESULT
    else
      return LHS_NIL_RESULT
    end
  end

  # check :expression
  def search_expression(node, code, vars_in_scope)
    node.each_named do |child|
      if child.type == :assignment_expression
        puts child
        right = child.child_by_field_name('right')
        right_value = code[right.start_byte...right.end_byte]
        left = child.child_by_field_name('left')
        left_value = code[left.start_byte...left.end_byte]
        line_number = child.start_point.row + 1
        puts "        line: #{line_number}"

        if right_value.include?('rb_check_typeddata')
          # find T_DATA struct
          left_value.gsub!(/[\(\)\*]/, '')
          cvar = find_cvar(vars_in_scope, left_value)

          if cvar.nil?
            puts "search_expression(): cvar not found"
            if vars_in_scope.is_a?(Hash)
              vars_in_scope.each_value do |cv|
                cv.show
              end
            else
              vars_in_scope.each do |cv|
                cv.show
              end
            end
            exit
          end

          cvar.is_typeddata = true

          # find parent obj
          call = find_typedthing_call(right, code)
          arguments = call.child_by_field_name('arguments')
          first_arg = arguments.named_child(0)
          parent_obj = code[first_arg.start_byte...first_arg.end_byte]
          puts parent_obj

          cvar.parent_obj = parent_obj
        end

        result = process_lhs(left, code, vars_in_scope)
        puts "result: #{result}"

        if result[:needWB]
          puts "        WRITEBARRIER on fire"
          @wb_list.add(left, left_value, right_value, line_number, vars_in_scope, result[:type_name])
        end
      else
        search_expression(child, code, vars_in_scope)
      end
    end
  end
  
  def run
    # load generated parser
    parser = TreeSitter::Parser.new
    language = TreeSitter::Language.load('c', @path_to_parser)
    parser.language = language

    # read c source from current directory
    src = File.read(@path_to_source)

    # parse
    tree = parser.parse_string(nil, src)
    root = tree.root_node

    # gather information from nodes
    first_path = FirstPath.new(root, src)
    first_path.run
    gvs_map = first_path.gvs_map
    struct_definitions = first_path.struct_definitions
    function_signatures = first_path.function_signatures

    # find the part of code that reuires write barrier
    second_path = SecondPath.new(root, src, gvs_map, struct_definitions, function_signatures)
    second_path.run

    # # show result
    # @wb_list.inspect
    # @wb_list.debug_sample(@struct_definitions)
    # puts "success"
  end
end
