require 'pathname'
require 'tree_sitter'

# get path for parser from environmental variables
PATH_TO_SOURCE = ENV['OBJECT']
PATH_TO_PARSER = ENV['PATH_TO_C99PARSER']
$vars = Hash.new
$numberOfFoundDeclarator = 0

# 3rd depth
# check :declaration (variable declaration)
# find variable type and name
# now is only for primitive types (need to deal with user-defined-type)
def searchDeclaration(node, code)
  varType = nil
  varName = nil

  node.each_named do |child|

    # locate type, pritimive and user_defined
    if child.type == :primitive_type || child.type == :type_identifier
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
    $vars[varType] ||= [] 
    $vars[varType] << varName 
  end
end

# 2nd depth
# check child node of :compound_statement
def searchCompoundStatement(node, code)
  node.each do |child|
    puts "    compound_statement's child node type: #{child.type}"

    # find the part of defining Variable
    if child.type == :declaration
      $numberOfFoundDeclarator += 1
      searchDeclaration(child, code)
    end
  end
end

# 1st depth
# check child node of :function_children
def searchFunction(node, code)
  node.each do |child|
    puts "  Function's child node type: #{child.type}"

    # find Function Body
    if child.type == :compound_statement
      searchCompoundStatement(child, code)
    end
  end
end


# main
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
puts $vars

