require 'tree_sitter'
require_relative 'classes'


class Parser
  def initialize(path_to_source, path_to_parser)
    @path_to_source = path_to_source
    @path_to_parser = path_to_parser
    @vars = []
    @number_of_found_declarator = 0
    @wb_list = WriteBarrierList.new
  end

  # 3rd depth
  # check :declaration (variable declaration)
  # find variable type and name
  # primitive type, user-defined type, pointer type
  def search_declaration(node, code)
    var_type = nil
    var_names = []

    node.each_named do |child|
      # locate type, pritimive and user_defined
      case child.type
      when :primitive_type, :type_identifier, :sized_type_specifier
        var_type = code[child.start_byte...child.end_byte]
        puts '      varType found'
      # locate variable name, no initialization
      when :identifier
        var_names << code[child.start_byte...child.end_byte]
        puts '      varName found'

      # locate variable name, has initialization
      when :init_declarator
        declarator = child.child_by_field_name('declarator')
        var_names << code[declarator.start_byte...declarator.end_byte]
        puts '      varName found'
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
      @vars << var
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

      pointer_count = 0
      left_value.each_char do |c|
        pointer_count += 1 if c == '*'
      end
      # 値へのアクセスのための * を削除、要修正？？
      left_value.gsub!('*', '')

      line_number = child.start_point.row + 1
      puts "        line: #{line_number}"

      # create cvar instance
      cvar = find_cvar(vars_in_scope, left_value)
      puts "        ASSIGNMENT to; name: #{cvar.name}, type: #{cvar.type}, is pointer?:#{cvar.is_pointer?}"

      if cvar.nil?
        puts('variable in expression not found')
        exit
      end
      if cvar.type == "VALUE" && pointer_count == 0
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
    end
    puts '==================================='

    # show result
    puts "number of found declarator: #{@number_of_found_declarator}"
    @vars.each do |var|
      puts "type: #{var.type}, name: #{var.name}, is pointer?: #{var.is_pointer?}, pointer count: #{var.pointer_count}"
    end
    puts
    @wb_list.list.each do |e|
      puts "write barrier insertion -> old: #{e.old}, new: #{e.new}, line number: #{e.line_number}"
    end
  end
end