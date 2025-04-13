require 'tree_sitter'
require_relative 'classes'
require_relative 'util'
require_relative 'first_path'

# analyze the node and find the point of code that write barrier required
class SecondPath
  LHS_NIL_RESULT = {type_name: nil, is_pointer_access: false, is_typeddata: false, needWB: false}
  LHS_WB_RESULT = {type_name: nil, is_pointer_access: true, is_typeddata: true, needWB: true}

  attr_reader :write_barrier_list
  def initialize(root, code, gvs_map, struct_definitions, function_signatures)
    @root = root
    @code = code
    @gvs_map = gvs_map
    @struct_definitions = struct_definitions
    @function_signatures = function_signatures

    @write_barrier_list = WriteBarrierList.new
  end

  # find rb_check_typeddata()'s node recursively , return found node
  def analyze_rbcheck_call(node)
    call = nil
    node.each_named do |child|
      str = @code[child.start_byte...child.end_byte]
      if child.named_child_count > 0
        call = analyze_rbcheck_call(child)
        # end
        if child.type == :call_expression && str.include?('rb_check_typeddata')
          call = child
        end
      end
    end
    return call
  end

  def process_lhs(node, vars_in_scope)
    case node.type
    when :identifier
      name = @code[node.start_byte...node.end_byte]
      name.gsub!(/[\(\)\*]/, '')
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
      operator = @code[operator_node.start_byte...operator_node.end_byte]
      argument = node.child_by_field_name('argument')
      field = node.child_by_field_name('field')
      argument_info = process_lhs(argument, vars_in_scope)

      unless argument_info[:is_typeddata]
        return LHS_NIL_RESULT
      end

      # check field
      field_info = nil
      if field.type == :field_identifier
        field_name = @code[field.start_byte...field.end_byte]
        field_cvar = @struct_definitions.find_field(argument_info[:type_name], field_name)
        field_info = {type_name: field_cvar.type, is_pointer_access: false, is_typeddata: false, needWB: false}
      else
        field_info = process_lhs(field, vars_in_scope)
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
        has_VALUE_element = @struct_definitions.has_VALUE_element?(new_type_name)

        # if it isn't struct or not expected access, return as needWB: false
        unless has_VALUE_element
          return {type_name: new_type_name, is_pointer_access: field_info[:is_pointer_access], is_typeddata: argument_info[:is_typeddata], needWB: false}
        end

        return {type_name: new_type_name, is_pointer_access: true, is_typeddata: true, needWB: true}
      end

    when :pointer_expression
      child = node.child_by_field_name('argument')
      result = process_lhs(child, vars_in_scope)
      result[:is_pointer_access] = true
      return result
    when :parenthesized_expression
      inner = node.named_child(0)
      return process_lhs(inner, vars_in_scope)

    when :assignment_expression
      inner = node.named_child(1)
      return process_lhs(inner, vars_in_scope)
    # when :call_expression, :cast_expression, :binary_expression, :subscript_expression
    #   return LHS_NIL_RESULT
    else
      return LHS_NIL_RESULT
    end
  end

  # analyze expression statement
  def analyze_expression(node, vars_in_scope)
    node.each_named do |child|
      if child.type == :assignment_expression
        right = child.child_by_field_name('right')
        right_value = @code[right.start_byte...right.end_byte]
        left = child.child_by_field_name('left')
        left_value = @code[left.start_byte...left.end_byte]
        if right_value.include?('rb_check_typeddata')
          # find T_DATA struct
          left_value.gsub!(/[\(\)\*]/, '')
          cvar = find_cvar(vars_in_scope, left_value)

          # for debug
          if cvar.nil?
            puts "analyze_expression(): cvar not found"
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
          call = analyze_rbcheck_call(right)
          arguments = call.child_by_field_name('arguments')
          first_arg = arguments.named_child(0)
          parent_obj = @code[first_arg.start_byte...first_arg.end_byte]
          cvar.parent_obj = parent_obj
        end

        result = process_lhs(left, vars_in_scope)
        if result[:needWB]
          line_number = child.start_point.row + 1
          @write_barrier_list.add(left, left_value, right_value, line_number, vars_in_scope, result[:type_name])
        end
      else
        analyze_expression(child, vars_in_scope)
      end
    end
  end

  # analyze block node
  # vars_in_local: map of variables in local scope
  def analyze_block(node, _vars_in_local)

    # duplicate vars_in_local to make new scope
    vars_in_local = _vars_in_local.clone

    # for statement might declare index variable on and after C99
    if node.type == :for_statement
      declarator = node.child_by_field_name('initializer')
      vars = analyze_single_declaration(declarator) if declarator
      vars.each {|var| vars_in_local[var.name] = var} # overwrite whether duplicated variable name or not
    end

    # analyze each child node
    node.each_named do |child|
      case child.type

      # declaration of new variable
      when :declaration
        vars = analyze_single_declaration(child)
        vars.each {|var| vars_in_local[var.name] = var} # overwrite whether duplicated variable name or not

      # any expression statement including assignment
      when :expression_statement
        # vars_in_local has priority over @gvs_map
        analyze_expression(child, @gvs_map.merge!(vars_in_local))

      # these statement can make new block scope
      when :if_statement, :else_clause, :compound_statement, :for_statement, :while_statement, :do_statement, :switch_statement
        analyze_block(child, vars_in_local)
      end
    end
  end

  def analyze_function(node)
    # extract function name
    fname_node = node
    while
      new_node = fname_node.child_by_field_name('declarator')
      break if new_node.nil?
      fname_node = new_node
    end
    fname = @code[fname_node.start_byte...fname_node.end_byte].strip

    # fetch a function signature
    function_signature = @function_signatures.find_by_fname(fname)
    unless function_signature
      puts "function signature not found: #{fname}"
      exit
    end

    # fetch parameter list
    # analyze function body
    body = node.child_by_field_name('body')
    analyze_block(body, function_signature.arg_list)
  end

  def run()
    @root.each_named do |node|
    analyze_function(node) if node.type == :function_definition
    end
  end
end
