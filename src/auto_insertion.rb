# frozen_string_literal: true

require 'pathname'
require 'tree_sitter'
require 'benchmark'
require 'objspace'

# get path for parser from environmental variables
PATH_TO_SOURCE = ENV['OBJECT']
PATH_TO_PARSER = ENV['PATH_TO_C99PARSER']
$vars = []
$number_of_found_declarator = 0

class CVar
  attr_accessor :type, :name, :pointer_count

  def initialize(type, name, pointer_count)
    @type = type
    @name = name
    @pointer_count = pointer_count
  end

  def is_pointer?
    @pointer_count.positive?
  end
end

def find_cvar(vars_in_scope, name)
  if vars_in_scope.size == 0
    puts "no variables in array"
    exit
  end
  vars_in_scope.each do |var|
    return var if var.name == name
  end
  nil
end

class WriteBarrier
  attr_accessor :old, :new, :line_number
  def initialize(old, new, line_number)
    @old = old
    @new = new
    @line_number = line_number
  end
end

class WriteBarrierList
  attr_reader :list
  def initialize()
    @list = Array.new
  end

  def add(old, new, line_number)
    @list << WriteBarrier.new(old, new, line_number)    
  end
end
# クラス定義の都合上ここに宣言, あとでコードを分けたい
$wb_list = WriteBarrierList.new

# 3rd depth
# check :declaration (variable declaration)
# find variable type and name
# primitive type, user-defined type, pointer type
def search_declaration(node, code)
  var_type = nil
  var_name = nil

  node.each_named do |child|
    # locate type, pritimive and user_defined
    case child.type
    when :primitive_type, :type_identifier, :sized_type_specifier
      var_type = code[child.start_byte...child.end_byte]
      puts '      varType found'
    # locate variable name, no initialization
    when :identifier
      var_name = code[child.start_byte...child.end_byte]
      puts '      varName found'

    # locate variable name, has initialization
    when :init_declarator
      declarator = child.child_by_field_name('declarator')
      var_name = code[declarator.start_byte...declarator.end_byte]
      puts '      varName found'
    end
  end

  return if var_type.nil? || var_name.nil?

  var_name.gsub!(' ', '')
  pointer_count = 0

  var_name.each_char do |c|
    pointer_count += 1 if c == '*'
  end
  var_name.gsub!('*', '')
  var = CVar.new(var_type, var_name, pointer_count)
  $vars << var
  return var
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

    cvar = find_cvar(vars_in_scope, left_value)
    if cvar.nil?
      puts('variable in expression not found')
      exit
    end

    line_number = child.start_point.row + 1
    puts "        ASSIGNMENT to; name: #{cvar.name}, ltype: #{cvar.type}, lispointer:#{cvar.is_pointer?} line: #{line_number}"
    if cvar.type == "VALUE" && pointer_count == 0
      puts "        WRITEBARRIER on fire"
      right = child.child_by_field_name('right')
      right_value = code[(right.start_byte + 1)...(right.end_byte - 1)]
      $wb_list.add(left_value, right_value, line_number)       
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
      $number_of_found_declarator += 1
      var = search_declaration(child, code)
      vars_in_scope << var
    end

    # find the part of Expression
    search_expression(child, code, vars_in_scope) if child.type == :expression_statement

  end
end

# 2nd depth
# check child node of :functin_declarator
def search_function_declarator(node, code)
  node.each_named do |child|
    puts "    child: #{child.type}"

    # the part of arguments
    case child.type
    when :parameter_list

      str_args = code[(child.start_byte + 1)...(child.end_byte - 1)].split(', ')
      args = Array.new
      str_args.each do |v|
        pointer_count = 0
        v.each_char do |c|
          pointer_count += 1 if c == '*'
        end
        v.gsub!('*', '')
        
        var_type, var_name = v.split(' ')
        var_type.gsub!(' ', '')
        var_name.gsub!(' ', '')

        args << CVar.new(var_type, var_name, pointer_count)
      end

      return args
    end
  end
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
  language = TreeSitter::Language.load('c', PATH_TO_PARSER)
  parser.language = language

  # read c source from current directory
  src = File.read(PATH_TO_SOURCE)

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
  puts "number of found declarator: #{$number_of_found_declarator}"
  $vars.each do |var|
    puts "type: #{var.type}, name: #{var.name}, is pointer?: #{var.is_pointer?}, pointer count: #{var.pointer_count}"
  end
  puts
  $wb_list.list.each do |e|
    puts "write barrier insertion -> old: #{e.old}, new: #{e.new}, line number: #{e.line_number}"
  end
end

# main

# mesure time and memory of whole program
# run gc in advance
GC.start

before = ObjectSpace.memsize_of_all
total_time = Benchmark.realtime do
  run
end
after = ObjectSpace.memsize_of_all

puts "Total processing time: #{total_time} seconds"
puts "Memory used before: #{before / 1024} KB"
puts "Memory used after : #{after / 1024} KB"
puts "Memory used diff  : #{(after - before) / 1024} KB"
