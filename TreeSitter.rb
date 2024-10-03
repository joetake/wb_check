require 'pathname'
require 'tree_sitter'

# get path for parser from environmental variables
PATH_TO_PARSER = ENV['PATH_TO_C99PARSER']

# check child node of :compound_statement's
def searchCompoundStatement(node)
  node.each do |child|
    puts "compound_statement's child node type: #{child.type}"
    if child.type == :declaration
      child.declarator
    end
  end
end

# check child node of :function_children
def searchFunction(node)
  node.each do |child|
    puts "Function's child node type: #{child.type}"
    if child.type == :compound_statement
      searchCompoundStatement(child)
    end
  end
end

puts PATH_TO_PARSER

# load generated parser
parser = TreeSitter::Parser.new
language = TreeSitter::Language.load('c', PATH_TO_PARSER)
parser.language = language

# read c source from current directory
src = File.read('source.c');

# parse
tree = parser.parse_string(nil, src)
root = tree.root_node

# check children nodes of root
root.each do |child|
  puts "child node type: #{child.type}"
  if child.type == :function_definition
    puts ''
    searchFunction(child)
  end
end

