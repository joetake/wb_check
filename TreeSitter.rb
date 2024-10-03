require 'pathname'
require 'tree_sitter'

# check child node of :compound_statement's
def searchCompoundStatement(node)
  node.each do |child|
    puts "compound_statement's child node type: #{child.type}"
    if child.type == :declaration
      p child
    end
  end
end

# check child node of :function_children
def searchFunction(node)
  puts node.fields
  node.each do |child|
    puts "Function's child node type: #{child.type}"
    if child.type == :compound_statement
      searchCompoundStatement(child)
    end
  end
end

# load generated parser
parser = TreeSitter::Parser.new
language = TreeSitter::Language.load('c', '/home/joe/lab/sources/tree-sitter-c/libtree-sitter-c.so')
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

