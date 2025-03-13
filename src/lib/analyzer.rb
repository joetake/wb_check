require 'tree_sitter'
require_relative 'classes'
require_relative 'first_path'

# $struct_definitions = StructDefinitions.new
# $functions_ret_type = FunctionsRetType.new

# list of global variables

class Analyzer
  LHS_NIL_RESULT = {type_name: nil, is_pointer_access: false, is_typeddata: false, needWB: false}
  LHS_WB_RESULT = {type_name: nil, is_pointer_access: true, is_typeddata: true, needWB: true}


  def initialize(path_to_source, path_to_parser)
    @path_to_source = path_to_source
    @path_to_parser = path_to_parser
    @wb_list = WriteBarrierList.new

    @gvs_map = nil
    @struct_definitions = nil
    @function_signatures = nil
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

  # check :declaration, return defined variables or fields
  def search_declaration(node, code)
    vars = {}  # Use hash map instead of array
    var_types = []
    var_names = []
    puts node
    node.each_named do |child|
      case child.type
      when :field_declaration
        type_node = child.child_by_field_name('type')
        declarator_node = child.child_by_field_name('declarator')
        if type_node && declarator_node
          var_type_str = code[type_node.start_byte...type_node.end_byte].strip
          var_name_str = code[declarator_node.start_byte...declarator_node.end_byte].strip
          pointer_count = var_name_str.count('*')
          var_name_str.delete!('*')

          var = CVar.new(var_type_str, var_name_str, pointer_count)
          vars[var_name_str] = var
        end
      when :primitive_type, :type_identifier, :sized_type_specifier
        var_types << code[child.start_byte...child.end_byte]

      # locate variable name, no initialization
      when :identifier, :pointer_declarator, :field_identifier
        var_names << code[child.start_byte...child.end_byte]
      when :array_declarator
        var_names << code[child.start_byte...child.end_byte].gsub(/\[\w+\]/, "*")

      # locate variable name, has initialization
      when :init_declarator
        declarator = child.child_by_field_name('declarator')
        var_names << code[declarator.start_byte...declarator.end_byte]
      when :poiinter_declarator

      # others
      when :union_specifier, :struct_specifier
        var_types << code[child.start_byte...child.end_byte]
      when :comment , :storage_class_specifier, :type_qualifier

      # only for debug
      # else
      #   puts "!! child type: #{child.type}"
      #   puts code[child.start_byte...child.end_byte]
      #   puts child
      #   exit
      end
    end
    pointer_count = 0
    if var_types.size == 1 && var_names.size > 0 && vars.empty?
      var_type = var_types[0]
      var_names.each do |var_name|
        var_name.gsub!(' ', '')
        pointer_count = 0

        var_name.each_char do |c|
          pointer_count += 1 if c == '*'
        end
        var_name.gsub!('*', '')
        var = CVar.new(var_type, var_name, pointer_count)
        var.show
        vars[var_name] = var
      end
      puts "!pointer_count: #{pointer_count}"
    elsif var_types.size == var_names.size && var_names.size > 0 && vars.empty?
      var_names.each_with_index do |var_name, i|
        var_name.gsub!(' ', '')
        pointer_count = 0

        var_name.each_char do |c|
          pointer_count += 1 if c == '*'
        end
        var_name.gsub!('*', '')
        var = CVar.new(var_types[i], var_name, pointer_count)
        vars[var_name] = var
      end
    # else
    #   exit
    end
    return vars
  end

  # 3rd depth
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
  
  # 2nd depth
  # check child node of :compound_statement, if, while, etc
  def search_inside_block(node, code, _vars_in_bscope)
    #  to not interfere the original hash
    vars_in_bscope = _vars_in_bscope.is_a?(Hash) ? _vars_in_bscope.dup : _vars_in_bscope.dup

    # for statement might declarate index variable
    if node.type == :for_statement
      declarator = node.child_by_field_name('initializer')
      if declarator && declarator.type == :declaration
        vars = search_declaration(declarator, code)
        if vars_in_bscope.is_a?(Hash)
          vars_in_bscope.merge!(vars)
        else
          # Convert old array to hash if needed
          new_vars = {}
          vars_in_bscope.each do |var|
            new_vars[var.name] = var
          end
          vars.each do |name, var|
            new_vars[name] = var
          end
          vars_in_bscope = new_vars
        end
      end
    end

    node.each do |child|
      line_number = child.start_point.row + 1
      puts "line: #{line_number}, inside block: #{child.type}"

      case child.type

      # find the part of defining Variable
      when :declaration
        vars = search_declaration(child, code)

        # Merge the new variables into the scope
        if vars_in_bscope.is_a?(Hash)
          vars_in_bscope.merge!(vars)
        else
          # Convert old array to hash if needed
          new_vars = {}
          vars_in_bscope.each do |var|
            new_vars[var.name] = var
          end
          vars.each do |name, var|
            new_vars[name] = var
          end
          vars_in_bscope = new_vars
        end

      # find the part of Expression
      when :expression_statement
        # Combine local and global variables
        if vars_in_bscope.is_a?(Hash) && @grobalv.is_a?(Hash)
          vars_in_scope = vars_in_bscope.merge(@grobalv)
        else
          # Fallback for backward compatibility
          vars_in_scope = Array(vars_in_bscope).concat(Array(@grobalv))
        end
        search_expression(child, code, vars_in_scope)
      when :if_statement, :else_clause, :compound_statement, :for_statement, :while_statement, :do_statement, :switch_statement
        search_inside_block(child, code, vars_in_bscope)
      end
    end
  end

  # 2nd depth
  # check child node of :functin_declarator
  def search_function_declarator(node, code)
    args = {} 

    node.each_named do |child|
      puts "    child: #{child.type}"

      # the part of arguments
      case child.type
      when :pointer_declarator
        params = search_function_declarator(child, code)
        args.merge!(params)
      when :parameter_list
        if child.named_child_count == 1
          declaration_node = child.named_child(0)
          type_node = declaration_node.child_by_field_name('type')
          puts type_node.type if type_node
          if type_node && type_node.type == :primitive_type
            param_text = code[type_node.start_byte...type_node.end_byte].strip
            # has no param
            if param_text == "void"
              return args
            end
          end
        end

        child.each_named do |param|
          if param.type == :parameter_declaration

            # get type and name
            type = param.child_by_field_name('type')
            declarator = param.child_by_field_name('declarator')

            next unless type && declarator

            var_type = code[type.start_byte...type.end_byte]
            var_name = code[declarator.start_byte...declarator.end_byte]

            # count pointer
            pointer_count = var_name.count('*')
            var_name.delete!('*')
            var_type.strip!
            var_name.strip!

            var = CVar.new(var_type, var_name, pointer_count)
            args[var_name] = var
          end
        end
      end
    end
    return args
  end

  # 1st depth
  # check child node of :function_definition
  def search_function(node, code)

    # 関数スコープ内にある変数を管理
    vars_in_bscope = {}  # Use hash map instead of array
    puts node
    node.each_named do |child|
      puts "  Function's child: #{child.type}"
      case child.type
      when :storage_class_specifier, :type_qualifier

      # return type
      when :primitive_type, :type_identifier
        type_str = code[child.start_byte...child.end_byte]
        pointer_count = type_str.count('*')
        type_str.delete!('*')
        f_declarator = node.child_by_field_name('declarator')

        # pointer_declaratorがネストしている場合があるので降りていく
        while f_declarator && f_declarator.type == :pointer_declarator
          pointer_count += 1  # "char *" が更に "*" 等で深い階層にある場合
          # 次の段階へ潜る
          f_declarator = f_declarator.child_by_field_name('declarator')
        end

        # 3) f_declarator 下から実際のidentifierを取得
        if f_declarator
          # もし function_declarator ならさらに同様に潜る
          while f_declarator.type == :function_declarator
            f_declarator = f_declarator.child_by_field_name('declarator')
          end
        end

        if f_declarator
          f_name = code[f_declarator.start_byte...f_declarator.end_byte]
          f_name.strip!
          if @functions_ret_type.include?(f_name)
            next
          end
          @functions_ret_type.register(f_name, type_str, pointer_count)
        end

      # deep into Function Declarator
      when :function_declarator, :pointer_declarator
        puts "  function_declarator's child: #{child}"
        params = search_function_declarator(child, code)
        vars_in_bscope.merge!(params)
        puts "params: #{params}"

      # deep into Function Body
      when :compound_statement
        search_inside_block(child, code, vars_in_bscope)
      end
    end
  end

  # initiate program
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

    first_path = FirstPath.new(root, src)
    first_path.run
    @gvs_map = first_path.gvs_map
    @struct_definitions = first_path.struct_definitions
    @function_signatures = first_path.function_signatures


    # # check children nodes of root
    # puts '==================================='
    # root.each_named do |child|
    #   line_number = child.start_point.row + 1
    #   puts "line #{line_number} child node type: #{child.type}"

    #   case child.type
    #   # find the part of defining Function
    #   when :function_definition
    #     search_function(child, src)
    #   # global variables, function proto
    #   when :declaration
    #     search_func_proto(child, src)

    #   # find the part of defining type (like Struct)
    #   when :type_definition, :union_specifier, :struct_specifier
    #     search_type_definition(child, src)
    #   end
    # end
    # puts '==================================='

    # # show result
    # @wb_list.inspect
    # @wb_list.debug_sample(@struct_definitions)
    # puts "success"
  end
end
