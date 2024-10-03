require 'pathname'
require 'tree_sitter'

# get path for parser from environmental variables
PATH_TO_PARSER = ENV['PATH_TO_C99PARSER']


# 3rd depth
# check :declaration (variable declaration)
def searchDeclaration(node, code)
  node.each do |child|
    if child.type == :primitive_type
      puts "      variable type: #{code[child.start_byte...child.end_byte]}"
    elsif child.type == :init_declarator
      declarator =  child.child_by_field_name('declarator')
      puts "      variable name: #{code[declarator.start_byte...declarator.end_byte]}"
    end 
  end
end

# 2nd depth
# check child node of :compound_statement
def searchCompoundStatement(node, code)
  node.each do |child|
    puts "    compound_statement's child node type: #{child.type}"
    if child.type == :declaration
      searchDeclaration(child, code)
    end
  end
end

# 1st depth
# check child node of :function_children
def searchFunction(node, code)
  node.each do |child|
    puts "  Function's child node type: #{child.type}"
    if child.type == :compound_statement
      searchCompoundStatement(child, code)
    end
  end
end


# load generated parser
parser = TreeSitter::Parser.new
language = TreeSitter::Language.load('c', PATH_TO_PARSER)
parser.language = language

# read c source from current directory
src = File.read('source.c');

# parse
tree = parser.parse_string(nil, src)
root = tree.root_node
puts "==================================="
puts root
puts "==================================="

# check children nodes of root
root.each do |child|
  puts "child node type: #{child.type}"
  if child.type == :function_definition
    searchFunction(child, src)
  end
end

