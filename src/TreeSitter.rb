require 'pathname'
require 'tree_sitter'
require 'benchmark'
require 'objspace'

# get path for parser from environmental variables
PATH_TO_SOURCE = ENV['OBJECT']
PATH_TO_PARSER = ENV['PATH_TO_C99PARSER']
$vars = Array.new
$numberOfFoundDeclarator = 0
class CVar
  attr_accessor :type, :name, :pointerCount
  def initialize(type, name, pointerCount)
    @type = type
    @name = name
    @pointerCount = pointerCount
  end

  def isPointer?
    @pointerCount > 0 ? true : false
  end
end
  

# 3rd depth
# check :declaration (variable declaration)
# find variable type and name
# now is only for primitive types (need to deal with user-defined-type)
def searchDeclaration(node, code)
  varType = nil
  varName = nil

  node.each_named do |child|

    # locate type, pritimive and user_defined
    if child.type == :primitive_type || child.type == :type_identifier || child.type == :sized_type_specifier
      varType = code[child.start_byte...child.end_byte]
      puts "      varType found"
    # locate variable name, no initialization
    elsif child.type == :identifier
      varName = code[child.start_byte...child.end_byte]
      puts "      varName found"

    # locate variable name, has initialization
    elsif child.type == :init_declarator
      declarator =  child.child_by_field_name('declarator')
      varName = code[declarator.start_byte...declarator.end_byte] 
      puts "      varName found"
    end 
  end

  if !(varType.nil? || varName.nil?) 
    varName.gsub!(" ", "")
    pointerCount = 0;

    varName.each_char do |c|
      pointerCount += 1 if c == '*'
    end
    varName.gsub!("*", "") 
    var = CVar.new(varType, varName, pointerCount)
    $vars << var
  end
end

# 3rd depth
# check :expression
def searchExpression(node, code)
  node.each_named do |child|
    if child.type == :assignment_expression
      left = child.child_by_field_name('left')
      leftValue = code[left.start_byte...left.end_byte]
      puts "        ASSIGNMENT, letfValue: #{leftValue}"
    end
  end
end

# 2nd depth
# check child node of :compound_statement
def searchCompoundStatement(node, code)
  node.each do |child|
    puts "    compound_statement's child: #{child.type}"

    # find the part of Expression
    if child.type == :expression_statement
      searchExpression(child, code)
    end

    # find the part of defining Variable
    if child.type == :declaration
      $numberOfFoundDeclarator += 1
      searchDeclaration(child, code)
    end
  end
end

# 2nd depth
# check child node of :functin_declarator
def searchFunctionDeclarator(node, code)
  node.each_named do |child|
    puts "    child: #{child.type}"

    # the part of arguments
    if child.type == :parameter_list
      args =  code[(child.start_byte + 1)...(child.end_byte - 1)].split(', ')
      if args.size > 0
        puts "#{args.size} args found: #{args}"
      end
    end
  end
end

# 1st depth
# check child node of :function_children
def searchFunction(node, code)
  node.each_named do |child|
    puts "  Function's child: #{child.type}"

    # deep into Function Declarator
    if child.type == :function_declarator
      puts "  function_declarator's child: #{child}" 
      searchFunctionDeclarator(child, code)
    end

    # deep into Function Body
    if child.type == :compound_statement
      searchCompoundStatement(child, code)
    end
  end
end


# initiate program
def run

# load generated parser
  parser = TreeSitter::Parser.new
  language = TreeSitter::Language.load('c', PATH_TO_PARSER)
  parser.language = language

  # read c source from current directory
  src = File.read(PATH_TO_SOURCE);

  # parse
  tree = parser.parse_string(nil, src)
  root = tree.root_node

  # check children nodes of root
  puts "==================================="
  root.each do |child|
    puts "child node type: #{child.type}"

    # find the part of defining Function
    if child.type == :function_definition
      searchFunction(child, src)
    end
  end
  puts "==================================="

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
  run()
end
after = ObjectSpace.memsize_of_all


puts "Total processing time: #{totalTime} seconds"
puts "Memory used before: #{before / 1024} KB"
puts "Memory used after : #{after / 1024} KB"
puts "Memory used diff  : #{(after - before) / 1024} KB"
