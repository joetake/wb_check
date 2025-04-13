require 'tree_sitter'
require_relative 'classes'
require_relative 'first_path'
require_relative 'second_path'

class Analyzer
  def initialize(path_to_source, path_to_parser)
    @path_to_source = path_to_source
    @path_to_parser = path_to_parser
    @wb_list = nil
  end

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

    # gather information from nodes
    first_path = FirstPath.new(root, src)
    first_path.run
    gvs_map = first_path.gvs_map
    struct_definitions = first_path.struct_definitions
    function_signatures = first_path.function_signatures

    # find the part of code that reuires write barrier
    second_path = SecondPath.new(root, src, gvs_map, struct_definitions, function_signatures)
    @wb_list = second_path.run

    # show result
    @wb_list.inspect
  end
end
