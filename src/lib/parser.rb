require 'tree_sitter'
require_relative 'classes'

$struct_definitions = StructDefinitions.new()

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
      cvar = find_cvar(vars_in_scope, name)
      return {cvar: cvar, is_gc_managed: false, field_type: cvar.type}
    when :pointer_expression
      child = node.child_by_field_name('argument')
      left_result = process_lhs(child, code, vars_in_scope)

      cvar = left_result[:cvar]
      # is_gc_managed = left_result[:is_gc_managed]
      is_gc_managed = true
      
      return {cvar: cvar, is_gc_managed: is_gc_managed, field_type: cvar.type} 
    when :field_expression
      receiver = node.child_by_field_name('argument')
      field = node.child_by_field_name('field')
      field_name = code[field.start_byte...field.end_byte]
      operator = node.child_by_field_name('operator')
      operator_name = code[operator.start_byte...operator.end_byte]

      left_result = process_lhs(receiver, code, vars_in_scope) 
      cvar = left_result[:cvar]
      is_gc_managed = left_result[:is_gc_managed]

      field = $struct_definitions.find_field(cvar.type, field_name)
      if field.nil?
        puts "there is no such field in struct_definitions: #{field_name}"
        puts "struct definitions:"
        $struct_definitions.inspect
        @wb_list.inspect
        exit
      end
      field_type = field.type
      
      # 暫定的に '->' の時はライトバリアが必要とみなす
      if operator_name == '->'
        is_gc_managed = true
        pointer_count = cvar.pointer_count + 1
      else
        is_gc_managed = left_result[:is_gc_managed]
        pointer_count = cvar.pointer_count
      end
      return {cvar: CVar.new(field_name, field_type, pointer_count), is_gc_managed: is_gc_managed, field_type: field_type}

    when :subscript_expression
      array_node = node.child_by_field_name('argument')
      array_code = code[array_node.start_byte...array_node.end_byte]      
      array_code.gsub!(/\[\w+\]/, "*")
      left_result = process_lhs(array_node, code, vars_in_scope)
      cvar = left_result[:cvar]
      is_gc_managed = true

      element_type = find_cvar(vars_in_scope, array_code)
      if element_type.nil?
        puts "there is no array in cvar set: #{element_type}"
        exit
      end

      return {cvar: cvar, is_gc_managed: is_gc_managed, field_type: cvar.type}
    else
      puts "未対応のノードタイプ: #{node.type}"
      exit
    end
  end

  # check :declaration, return defined variables or fields
  def search_declaration(node, code)
    var_type = nil
    var_names = []

    node.each_named do |child|
      # locate type, pritimive and user_defined
      case child.type
      when :primitive_type, :type_identifier, :sized_type_specifier
        var_type = code[child.start_byte...child.end_byte]
      # locate variable name, no initialization
      when :identifier, :field_identifier
        var_names << code[child.start_byte...child.end_byte]

      # locate variable name, has initialization
      when :init_declarator, :pointer_declarator
        declarator = child.child_by_field_name('declarator')
        var_names << code[declarator.start_byte...declarator.end_byte]
      when :array_declarator
        var_names << code[child.start_byte...child.end_byte].gsub(/\[\w+\]/, "*")
      end
    end

    # もういらない？
    # return if var_type.nil? || var_name.nil?

    vars = []
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
    return vars
  end

  # 3rd depth
  # check :expression
  def search_expression(node, code, vars_in_scope)
    node.each_named do |child|
      next unless child.type == :assignment_expression

      puts child
      left = child.child_by_field_name('left')
      left_value = code[left.start_byte...left.end_byte]
      line_number = child.start_point.row + 1
      puts "        line: #{line_number}"
      puts left

      analyzed_lhs_info = process_lhs(left, code, vars_in_scope)
      cvar = analyzed_lhs_info[:cvar]
      is_gc_managed = analyzed_lhs_info[:is_gc_managed]
      field_type = analyzed_lhs_info[:field_type] 

      if cvar.nil?
        puts "couldn't find variable while analyze expression"
        exit
      end
      
      puts "field_type: #{field_type}, is_gc_managed: #{is_gc_managed}"
      if field_type == "VALUE" && is_gc_managed
        puts "        WRITEBARRIER on fire"
        right = child.child_by_field_name('right')
        right_value = code[right.start_byte...right.end_byte]
        @wb_list.add(left_value, right_value, line_number)       
      end
    end
  end

  # 2nd depth
  # check child node of :compound_statement
  def search_compound_statement(node, code, vars_in_scope)
    node.each do |child|
      puts "    compound_statement's child: #{child.type}"

      # find the part of defining Variable
      if child.type == :declaration
        @number_of_found_declarator += 1
        vars = search_declaration(child, code)
        vars_in_scope.concat(vars)
      end

      # find the part of Expression
      search_expression(child, code, vars_in_scope) if child.type == :expression_statement

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

    # 関数スコープ内にある変数と関数の引数を管理、ブロック内の変数などのスコープ管理はまだ
    vars_in_scope = []

    node.each_named do |child|
      puts "  Function's child: #{child.type}"

      # deep into Function Declarator
      if child.type == :function_declarator
        puts "  function_declarator's child: #{child}"
        args = search_function_declarator(child, code)
        vars_in_scope.concat(Array(args))
      end

      # deep into Function Body
      search_compound_statement(child, code, vars_in_scope) if child.type == :compound_statement
    end
  end

  # 1st depth
  # check child node of :type_definition
  def search_type_definition(node, code)

    # check the definition of field
    type_name = node.child_by_field_name('declarator')
    type_name = code[type_name.start_byte...type_name.end_byte]


    struct_node = node.child_by_field_name('type').child_by_field_name('body')

    field_list = []
    struct_node.each_named do |c|
      field_list.concat(search_declaration(c, code))
    end 

    # register definition of struct
    struct_definition = StructDefinition.new(type_name, field_list)
    $struct_definitions.register(struct_definition)
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
      puts "child node type: #{child.type}"

      # find the part of defining Function
      search_function(child, src) if child.type == :function_definition

      # find the part of defining type (like Struct)
      search_type_definition(child, src) if child.type == :type_definition
    end
    puts '==================================='

    # show result
    @wb_list.inspect
  end
end