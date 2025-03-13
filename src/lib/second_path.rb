require 'tree_sitter'
require_relative 'classes'
require_relative 'util'
require_relative 'first_path'

# analyze the node and find the point of code that write barrier required
class SecondPath
  def initialize(root, code, gvs_map, struct_definitions, function_signatures)
    @root = root
    @code = code
    @gvs_map = gvs_map
    @struct_definitions = struct_definitions
    @function_signatures = function_signatures

    @write_barrier_list = WriteBarrierList.new
  end

  # analyze block node
  # vars_in_local: map of variables in local scope
  def analyze_block(node, function_signature, _vars_in_local)

    # duplicate vars_in_local to make new scope
    vars_in_local = _vars_in_local.clone
    
    # for statement might declare index variable on and after C99
    if node.type == :for_statement
      declarator = node.child_by_field_name('initializer')
      vars = analyze_single_declaration(declarator) if declarator
      vars.each {|var| vars_in_local[var.name] = var} # overwrite whether duplicated variable name or not
    end

    # analyze each child node
    node.each_named do |child|
      case child.type
      
      # declaration of new variable
      when :declaration
        vars = analyze_single_declaration(child)
        vars.each {|var| vars_in_local[var.name] = var} # overwrite whether duplicated variable name or not

      # any expression statement including assignment
      when :expression_statement

      # these statement can make new block scope
      when :if_statement, :else_clause, :compound_statement, :for_statement, :while_statement, :do_statement, :switch_statement
        analyze_block(child, function_signature, vars_in_local)
      end
    end
  end

  def analyze_function(node)
    # extract function name
    fname_node = node
    while
      new_node = fname_node.child_by_field_name('declarator')
      break if new_node.nil?
      fname_node = new_node
    end
    fname = @code[fname_node.start_byte...fname_node.end_byte].strip

    # fetch a function signature
    function_signature = @function_signatures.find_by_fname(fname)
    unless function_signature
      puts "function signature not found: #{fname}"
      exit
    end

    # analyze function body
    body = node.child_by_field_name('body')
    analyze_block(body, function_signature, {})
  end

  def run()
    @root.each_named do |node|
    analyze_function(node) if node.type == :function_definition
    end
  end
end