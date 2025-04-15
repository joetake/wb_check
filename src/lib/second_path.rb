require 'tree_sitter'
require_relative 'classes'
require_relative 'util'
require_relative 'first_path'

# analyze the node and find the point of code that write barrier required
class SecondPath
  LHS_NIL_RESULT = {type_name: nil, is_pointer_access: false, is_typeddata: false, needWB: false, param: nil}

  attr_reader :write_barrier_list
  def initialize(root, code, gvs_map, struct_definitions, function_signatures)
    @root = root
    @code = code
    @gvs_map = gvs_map
    @struct_definitions = struct_definitions
    @function_signatures = function_signatures

    @write_barrier_list = WriteBarrierList.new
    @context_stack = ContextStack.new
  end

  def traverse_inside_function_call(function_signature, marked_parameter_index)
    # set context
    @context_stack.push(Context.new(marked_parameter_index))

    analyze_function(function_signature.self_node)

    # get and reset context
    ret = @context_stack.pop
    unless @context_stack.empty?
      @context_stack.current_context.changed_parameter_index = ret.changed_parameter_index
    end
    return ret
  end

  def analyze_function_call(node, vars_in_scope)
    function = node.child_by_field_name('function')
    function_name = @code[function.start_byte...function.end_byte]
    arguments = node.child_by_field_name('arguments')
    puts line_number = node.start_point.row + 1
    puts "#{function_name}, arguments: #{arguments}"

    ctr = 0
    marked_argument_index = Array.new
    arguments.each_named do |arg|
      tmp = arg
      # find identifier node
      while tmp.type != :identifier
        break if tmp.named_child_count == 0
        tmp = tmp.named_child(0)
      end
      identifier = tmp

      arg_name = @code[identifier.start_byte...identifier.end_byte]
      cvar = find_cvar(vars_in_scope, arg_name)

      # cvar can be nil if the argument is not a variable
      next if cvar.nil?
      puts "i: #{ctr}, arg_name: #{arg_name}, is_typeddata: #{cvar.is_typeddata}"

      if cvar.is_typeddata
        marked_argument_index << ctr
      end

      ctr += 1
    end

    puts "marked_argument_index: #{marked_argument_index}"
    if marked_argument_index.size > 0
      # initialize index list
      changed_argument_index = Array.new

      function_signature = @function_signatures.find_by_fname(function_name)

      # signature doesn't exist, defined in external
      if function_signature.nil?

        # specific case # memcpy has 1st argument as destination
        # todo: add more known func list
        puts "function signature not found: #{function_name}"
        if function_name == 'memcpy' && marked_argument_index.include?(0)
          puts "aa"
          if @context_stack.empty?
            @write_barrier_list.add(nil, "aa", nil, nil, line_number, nil, nil, :low)
          else
            @context.current_context.changed_parameter_index << 0
          end
        end
        return 
      end

      # we can analyze more deeply
      if function_signature.has_body?
        context  = traverse_inside_function_call(function_signature, marked_argument_index)
        puts "changed_argument_index: #{context.changed_parameter_index}"
      end

      line_number = node.start_point.row + 1
      function_signature.arg_list.each do |arg, i|
        if context.changed_parameter_index.include?(i)
          @write_barrier_list.add(nil, arg, nil, nil, line_number, nil, nil, :low)
        end
      end

    end
  end

  # find :call_expression recursively
  def find_function_call(node, vars_in_scope)
    analyze_function_call(node, vars_in_scope) if node.type == :call_expression
    node.each_named do |child|
      find_function_call(child, vars_in_scope)
    end
    nil
  end

  # find parent object from rb_check_typeddata
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

  # analyze lhs of assignment expression
  # find a reference changed point
  def process_lhs(node, vars_in_scope)
    case node.type
    when :identifier
      name = @code[node.start_byte...node.end_byte]
      name.gsub!(/[\(\)\*]/, '')
      cvar = find_cvar(vars_in_scope, name)

      return LHS_NIL_RESULT if cvar.nil?
      type_name = cvar.type
      if type_name.split(' ').size > 1
        type_name = type_name.split(' ').last
      end
      param = nil
      if cvar.is_parameter
        param = cvar
      end
      return {type_name: type_name, is_pointer_access: false, is_typeddata: cvar.is_typeddata, needWB: false, param: param}
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
        field_info = {type_name: field_cvar.type, is_pointer_access: false, is_typeddata: false, needWB: false, param: argument_info[:param]}
      else
        field_info = process_lhs(field, vars_in_scope)
        # if field expression in field is needWB: true return immediately
        return field_info if field_info[:needWB]
      end

      expected_access = (operator == '->') || (operator == '.' && argument_info[:is_pointer_access])
      new_type_name = normalize_type_name(field_info[:type_name])
      # check need WB or not
      if new_type_name == 'VALUE' && expected_access
        return {type_name: 'VALUE', is_pointer_access: true, is_typeddata: false, needWB: true, param: argument_info[:param]}
      else

        # check struct in field has VALUE element or not
        has_VALUE_element = @struct_definitions.has_VALUE_element?(new_type_name)

        # if it isn't struct or not expected access, return as needWB: false
        unless has_VALUE_element
          return {type_name: new_type_name, is_pointer_access: field_info[:is_pointer_access], is_typeddata: argument_info[:is_typeddata], needWB: false, param: argument_info[:param]}
        end

        # if it is struct and expected access, return as needWB: true
        return {type_name: new_type_name, is_pointer_access: true, is_typeddata: true, needWB: true, param: argument_info[:param]}
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

  def analyze_assignment(child, vars_in_scope)
    right = child.child_by_field_name('right')
    right_value = @code[right.start_byte...right.end_byte]
    left = child.child_by_field_name('left')
    left_value = @code[left.start_byte...left.end_byte]
    if right_value.include?('rb_check_typeddata')
      # find T_DATA struct
      left_value.gsub!(/[\(\)\*]/, '')
      cvar = find_cvar(vars_in_scope, left_value)

      cvar.is_typeddata = true
      # find parent obj
      call = analyze_rbcheck_call(right)
      arguments = call.child_by_field_name('arguments')
      first_arg = arguments.named_child(0)
      parent_obj = @code[first_arg.start_byte...first_arg.end_byte]
      cvar.parent_obj = parent_obj
    else

      # find function call from rhs
      find_function_call(right, vars_in_scope)
    end

    result = process_lhs(left, vars_in_scope)
    if result[:needWB]
      if @context_stack.empty?
        line_number = child.start_point.row + 1
        @write_barrier_list.add(left, left_value, right_value, line_number, vars_in_scope, result[:type_name], :high)
      elsif result[:param]
        ctr = 0
        @context_stack.current_context.current_function_params.each do |param|
          if param[1].name == result[:param].name
            @changed_parameter_index = ctr
            @context_stack.current_context.changed_parameter_index << ctr
          end
          ctr += 1
        end
      end
    end
  end

  # analyze expression statement
  def analyze_expression(node, vars_in_scope)
    node.each_named do |child|
      case child.type
      when :assignment_expression
        analyze_assignment(child, vars_in_scope)
      when :call_expression
        analyze_function_call(child, vars_in_scope)
      else
        analyze_expression(child, vars_in_scope)
      end
    end
  end

  def analyze_node(node, vars_in_local)
    case node.type
    when :declaration
      vars = analyze_single_declaration(node)
      vars.each { |var| vars_in_local[var.name] = var }
    when :expression_statement
      analyze_expression(node, @gvs_map.merge(vars_in_local))
    when :if_statement, :else_clause, :compound_statement, :for_statement, :while_statement, :do_statement, :switch_statement
      node.each_named do |child|
        analyze_block(child, vars_in_local)
      end
    when :call_expression
      analyze_function_call(node, @gvs_map.merge(vars_in_local))
    else
      node.each_named do |child|
        analyze_node(child, vars_in_local)
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

    node.each_named do |child|
      analyze_node(child, vars_in_local)
    end
    # # analyze each child node
    # node.each_named do |child|
    #   puts "child: #{child.type}"
    #   case child.type

    #   # declaration of new variable
    #   when :declaration
    #     vars = analyze_single_declaration(child)
    #     vars.each {|var| vars_in_local[var.name] = var} # overwrite whether duplicated variable name or not

    #   # any expression statement including assignment
    #   when :expression_statement
    #     # vars_in_local has priority over @gvs_map
    #     analyze_expression(child, @gvs_map.merge!(vars_in_local))

    #   # these statement can make new block scope
    #   when :if_statement, :else_clause, :compound_statement, :for_statement, :while_statement, :do_statement, :switch_statement
    #     analyze_block(child, vars_in_local)
      
    #   when :call_expression
    #     analyze_function_call(child, @gvs_map.merge!(vars_in_local))
    #   end
    # end

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
    arguments = Hash.new

    unless @context_stack.empty?
      c = @context_stack.current_context
      function_signature.arg_list.each_with_index do |arg, i|

        # avoid overwriting
        new_arg = arg.deep_clone
        if c.marked_argument_index.include?(i)
          new_arg.is_typeddata = true
        end
        new_arg.is_parameter = true
        # convert argument list, array to hash
        arguments[new_arg.name] = new_arg
      end
    c.current_function_params = arguments
    else
      function_signature.arg_list.each {|arg| arguments[arg.name] = arg}
    end

    analyze_block(body, arguments)
  end

  def run()
    @root.each_named do |node|
    analyze_function(node) if node.type == :function_definition
    end
  end
end
