require 'tree_sitter'
require_relative 'classes'

$struct_definitions = StructDefinitions.new
$functions_ret_type = FunctionsRetType.new

# list of global variables
$grobalv = Array.new

class Parser
  def initialize(path_to_source, path_to_parser)
    @path_to_source = path_to_source
    @path_to_parser = path_to_parser
    @number_of_found_declarator = 0
    @wb_list = WriteBarrierList.new
  end

  def process_lhs(node, code, vars_in_scope)
    case node.type
    when :identifier
      name = code[node.start_byte...node.end_byte]
      name.gsub!(/[\(\)\*]/, '')
      puts "name: #{name}"
      cvar = find_cvar(vars_in_scope, name)
      return cvar.is_typeddata
    when :pointer_expression
      child = node.child_by_field_name('argument')
      result = process_lhs(child, code, vars_in_scope)

      return result
    when :field_expression
      receiver = node.child_by_field_name('argument')
      result = process_lhs(receiver, code, vars_in_scope)
      return result

    when :subscript_expression
      array_node = node.child_by_field_name('argument')
      result = process_lhs(array_node, code, vars_in_scope)
      return result
    when :parenthesized_expression
      inner = node.named_child(0)
      return process_lhs(inner, code, vars_in_scope)
    when :call_expression
      return false
    else
      puts "未対応のノードタイプ: #{node.type}"
      exit
    end
  end

  # check :declaration, return defined variables or fields
  def search_declaration(node, code)
    vars = []
    var_types = []
    var_names = []
    node.each_named do |child|
      case child.type
      when :preproc_else, :preproc_ifdef, :preproc_if
        ret = search_declaration(child, code)
        vars.concat(ret) unless ret.nil?
      when :field_declaration
        type_node = child.child_by_field_name('type')
        declarator_node = child.child_by_field_name('declarator')
        if type_node && declarator_node
          var_type_str = code[type_node.start_byte...type_node.end_byte].strip
          var_name_str = code[declarator_node.start_byte...declarator_node.end_byte].strip
          pointer_count = var_name_str.count('*')
          var_name_str.delete!('*')

          var = CVar.new(var_type_str, var_name_str, pointer_count)
          vars << var
        end
      when :primitive_type, :type_identifier, :sized_type_specifier
        var_types << code[child.start_byte...child.end_byte]

      # locate variable name, no initialization
      when :identifier, :field_identifier
        var_names << code[child.start_byte...child.end_byte]
      when :array_declarator
        var_names << code[child.start_byte...child.end_byte].gsub(/\[\w+\]/, "*")

      # locate variable name, has initialization
      when :init_declarator, :pointer_declarator
        declarator = child.child_by_field_name('declarator')
        var_names << code[declarator.start_byte...declarator.end_byte]

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
        vars << var
      end
    elsif var_types.size == var_names.size && var_names.size > 0 && vars.empty?
      var_names.each do |var_name, i|
        var_name.gsub!(' ', '')
        pointer_count = 0

        var_name.each_char do |c|
          pointer_count += 1 if c == '*'
        end
        var_name.gsub!('*', '')
        var = CVar.new(var_types[i], var_name, pointer_count)
        vars << var
      end
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
        left = child.child_by_field_name('left')
        left_value = code[left.start_byte...left.end_byte]
        line_number = child.start_point.row + 1
        puts "        line: #{line_number}"

        if right_value.include?('rb_check_typeddata')
          left_value.gsub!(/[\(\)\*]/, '')
          puts left_value
          cvar = find_cvar(vars_in_scope, left_value) 
          cvar.is_typeddata = true
        end

        result = process_lhs(left, code, vars_in_scope)

        if result && !right_value.include?('rb_check_typeddata')
          puts "        WRITEBARRIER on fire"
          @wb_list.add(left_value, right_value, line_number)
        end
      else
        search_expression(child, code, vars_in_scope)
      end
    end
  end


  # 2nd depth
  # check child node of :compound_statement, if, while, etc
  def search_inside_block(node, code, _vars_in_bscope)

    #  to not interfere the original array
    vars_in_bscope = _vars_in_bscope.dup
    node.each do |child|
      puts "    inside block: #{child.type}"

      case child.type

      # find the part of defining Variable
      when :declaration
      vars = search_declaration(child, code)

=begin
      # if already there is the same element to vars, delete it for update
      vars.each do |va|
        vars_in_bscope.delete_if{|v| v.name = va.name}
      end
=end
      vars_in_bscope.concat(vars)

      # find the part of Expression
      when :expression_statement
      _vars_in_bscope = vars_in_bscope.dup
      vars_in_scope = Array(_vars_in_bscope).concat(Array($globalv))
      search_expression(child, code, vars_in_scope)
      when :if_statement, :else_clause, :compound_statement
        search_inside_block(child, code, vars_in_bscope)
      end

    end
  end

  # 2nd depth
  # check child node of :functin_declarator
  def search_function_declarator(node, code)
    args = []

    node.each_named do |child|
      puts "    child: #{child.type}"

      # the part of arguments
      case child.type
      when :parameter_list
       if child.named_child_count == 1
          declaration_node = child.named_child(0)
          type_node = declaration_node.child_by_field_name('type')
          puts type_node.type
          if type_node.type == :primitive_type
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

            var_type = code[type.start_byte...type.end_byte]
            var_name = code[declarator.start_byte...declarator.end_byte]

            # count pointer
            pointer_count = var_name.count('*')
            var_name.delete!('*')
            var_type.strip!
            var_name.strip!

            args << CVar.new(var_type, var_name, pointer_count)
          end
        end
      end
    end
    return args
  end

  # 1st depth
  # check child node of :function_children
  def search_function(node, code)

    # 関数スコープ内にある変数を管理
    vars_in_bscope = []
    puts node
    node.each_named do |child|
      puts "  Function's child: #{child.type}"
      case child.type

      # return type
      when :primitive_type, :type_identifier
        type_str = code[child.start_byte...child.end_byte]
        pointer_count = type_str.count('*')
        type_str.delete!('*')
        f_declarator = node.child_by_field_name('declarator')
        f_identifier = f_declarator.child(0)
        f_name = code[f_identifier.start_byte...f_identifier.end_byte]
        $functions_ret_type.register(f_name, type_str, pointer_count)
        puts $functions_ret_type

      # deep into Function Declarator
      when :function_declarator
        puts "  function_declarator's child: #{child}"
        args = search_function_declarator(child, code)
        vars_in_bscope.concat(Array(args))

      # deep into Function Body
      when :compound_statement
        search_inside_block(child, code, vars_in_bscope)
      end
    end

  end

  # 1st depth
  # check child node of :type_definition
  def search_type_definition(node, code)

    puts node
    # check the definition of field
    case node.type
    when :type_definition
      type_name = node.child_by_field_name('declarator')
      struct_node = node.child_by_field_name('type').child_by_field_name('body')
    when :struct_specifier, :union_specifier
      type_name = node.child_by_field_name('name')
      struct_node = node.child_by_field_name('body')
    end
    type_name = code[type_name.start_byte...type_name.end_byte]


    # is struct or union definition
    if struct_node
      field_list = []
      struct_node.each_named do |c|
        field_list.concat(search_declaration(c, code))
      end

      # register definition of struct
      struct_definition = StructDefinition.new(type_name, field_list)
      $struct_definitions.register(struct_definition)

    #
    else
      return
    end
  end

  # 1st depth, function proto definition or global
  # ロジックがぐちゃぐちゃなので整理したい
  def search_func_proto(node, code)
    puts node
    function_decl = node.child_by_field_name('declarator')

    # if it's global variable declaration, it should not have declarator of declarator
    if function_decl.child_by_field_name('declarator').nil?
      gvs = search_declaration(node, code)
      $globalv = Array($globalv).concat(Array(gvs))
    end

    if function_decl.type == :identifier
      puts "#{code[function_decl.start_byte...function_decl.end_byte]}, #{code[node.start_byte...node.end_byte]}"
    end
    return if function_decl.nil? || (function_decl.type != :function_declarator && function_decl.type != :pointer_declarator)

    if function_decl.type == :pointer_declarator
      function_decl = function_decl.child_by_field_name('declarator')
    end
    type_node = node.child_by_field_name('type')
    if type_node.nil?
      type_node = node.child_by_field_name('declartor')
    end

    type_str = code[type_node.start_byte...type_node.end_byte]
    pointer_count = type_str.count('*')
    type_str.delete!('*')

    func_id_node = function_decl.child_by_field_name('declarator')
    puts "type_str: #{type_str}, pointer_count: #{pointer_count}"
    return if func_id_node.nil?
    func_name = code[func_id_node.start_byte...func_id_node.end_byte]

    $functions_ret_type.register(func_name.strip, type_str.strip, pointer_count)
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

    # check children nodes of root
    puts '==================================='
    root.each do |child|
      line_number = child.start_point.row + 1
      puts "line #{line_number} child node type: #{child.type}"

      case child.type
      # find the part of defining Function
      when :function_definition
        search_function(child, src)
      # global variables, function proto
      when :declaration
        search_func_proto(child, src)

      # find the part of defining type (like Struct)
      when :type_definition, :union_specifier, :struct_specifier
        search_type_definition(child, src)
      end
    end
    puts '==================================='

    # show result
    @wb_list.inspect
    puts "success"
  end
end
