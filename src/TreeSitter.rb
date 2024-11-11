# frozen_string_literal: true

require 'pathname'
require 'tree_sitter'
require 'benchmark'
require 'objspace'

# get path for parser from environmental variables
PATH_TO_SOURCE = ENV['OBJECT']
PATH_TO_PARSER = ENV['PATH_TO_C99PARSER']
$vars = []
$numberOfFoundDeclarator = 0
class CVar
  attr_accessor :type, :name, :pointerCount

  def initialize(type, name, pointerCount)
    @type = type
    @name = name
    @pointerCount = pointerCount
  end

  def isPointer?
    @pointerCount.positive?
  end
end

def findCvar(vars_in_scope, name)
  if vars_in_scope.size == 0
    puts "no variables in array"
    exit
  end
  vars_in_scope.each do |var|
    return var if var.name == name
  end
  nil
end

# 3rd depth
# check :declaration (variable declaration)
# find variable type and name
# primitive type, user-defined type, pointer type
def searchDeclaration(node, code)
  varType = nil
  varName = nil

  node.each_named do |child|
    # locate type, pritimive and user_defined
    case child.type
    when :primitive_type, :type_identifier, :sized_type_specifier
      varType = code[child.start_byte...child.end_byte]
      puts '      varType found'
    # locate variable name, no initialization
    when :identifier
      varName = code[child.start_byte...child.end_byte]
      puts '      varName found'

    # locate variable name, has initialization
    when :init_declarator
      declarator = child.child_by_field_name('declarator')
      varName = code[declarator.start_byte...declarator.end_byte]
      puts '      varName found'
    end
  end

  return if varType.nil? || varName.nil?

  varName.gsub!(' ', '')
  pointerCount = 0

  varName.each_char do |c|
    pointerCount += 1 if c == '*'
  end
  varName.gsub!('*', '')
  var = CVar.new(varType, varName, pointerCount)
  $vars << var
  return var
end

# 3rd depth
# check :expression
def searchExpression(node, code, vars_in_scope)
  node.each_named do |child|
    next unless child.type == :assignment_expression

    left = child.child_by_field_name('left')
    leftValue = code[left.start_byte...left.end_byte]

    # 値へのアクセスのための * を削除、要修正？？
    leftValue.gsub!('*', '')
    puts "   "
    cvar = findCvar(vars_in_scope, leftValue)
    if cvar.nil?
      puts('variable in expression not found')
      exit
    end

    line_number = child.start_point.row + 1
    puts "        ASSIGNMENT to; name: #{cvar.name}, ltype: #{cvar.type}, lispointer:#{cvar.isPointer?} line: #{line_number}"
  end
end

# 2nd depth
# check child node of :compound_statement
def searchCompoundStatement(node, code, vars_in_scope)
  node.each do |child|
    puts "    compound_statement's child: #{child.type}"

    # find the part of defining Variable
    if child.type == :declaration
      $numberOfFoundDeclarator += 1
      var = searchDeclaration(child, code)
      vars_in_scope << var
    end

    # find the part of Expression
    searchExpression(child, code, vars_in_scope) if child.type == :expression_statement

  end
end

# 2nd depth
# check child node of :functin_declarator
def searchFunctionDeclarator(node, code)
  node.each_named do |child|
    puts "    child: #{child.type}"

    # the part of arguments
    case child.type
    when :parameter_list

      str_args = code[(child.start_byte + 1)...(child.end_byte - 1)].split(', ')
      args = Array.new
      str_args.each do |v|
        pointerCount = 0
        v.each_char do |c|
          pointerCount += 1 if c == '*'
        end
        v.gsub!('*', '')
        
        var_type, var_name = v.split(' ')
        var_type.gsub!(' ', '')
        var_name.gsub!(' ', '')

        args << CVar.new(var_type, var_name, pointerCount)
      end

      return args
    end
  end
end

# 1st depth
# check child node of :function_children
def searchFunction(node, code)

  # 関数スコープ内にある変数と関数の引数を管理、ブロック内の変数などのスコープ管理はまだ
  vars_in_scope = []

  node.each_named do |child|
    puts "  Function's child: #{child.type}"

    # deep into Function Declarator
    if child.type == :function_declarator
      puts "  function_declarator's child: #{child}"
      args = searchFunctionDeclarator(child, code)
      vars_in_scope.concat(Array(args))
    end

    # deep into Function Body
    searchCompoundStatement(child, code, vars_in_scope) if child.type == :compound_statement
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
    searchFunction(child, src) if child.type == :function_definition
  end
  puts '==================================='

  # show result
  puts "number of found declarator: #{$numberOfFoundDeclarator}"
  $vars.each do |var|
    puts "type: #{var.type}, name: #{var.name}, isPointer?: #{var.isPointer?}, pointerCount: #{var.pointerCount}"
  end
  puts
end

# main

# mesure time and memory of whole program
# run gc in advance
GC.start

before = ObjectSpace.memsize_of_all
totalTime = Benchmark.realtime do
  run
end
after = ObjectSpace.memsize_of_all

puts "Total processing time: #{totalTime} seconds"
puts "Memory used before: #{before / 1024} KB"
puts "Memory used after : #{after / 1024} KB"
puts "Memory used diff  : #{(after - before) / 1024} KB"
