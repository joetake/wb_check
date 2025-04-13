require 'tree_sitter'
require_relative 'classes'
require_relative 'util'

# gather inormation about
#  - struct difinition
#  - global variable
#  - function signature
class FirstPath
  attr_reader :gvs_map, :struct_definitions, :function_signatures
  def initialize(root, code)
    @root = root
    @code = code
    @function_definitions = {}

    # information holder
    @gvs_map = {}
    @struct_definitions = StructDefinitions.new
    @function_signatures = FunctionSignatures.new
  end

  # type_definition: typedef struct { ... } type_name;
  # struct_specifier: struct type_name { ... };
  # union_specifier: union type_name { ... };
  def get_struct_definition(node)
    type_name = nil
    struct_node = nil

    case node.type
    # extract type name node and struct node in each case
    when :type_definition
      type_name = node.child_by_field_name('declarator')
      struct_node = node.child_by_field_name('type')&.child_by_field_name('body')
    when :struct_specifier, :union_specifier
      type_name = node.child_by_field_name('name')
      struct_node = node.child_by_field_name('body')
    end

    # check if type_name and struct_node are found
    return nil if type_name.nil? ||  struct_node.nil?
    type_name = @code[type_name.start_byte...type_name.end_byte]

    # find field list in struct_node
    field_map = {}
    if struct_node
      struct_node.each_named do |child|
        vars = analyze_single_declaration(child)
        vars.each do |var|
          field_map[var.name] = var
        end
      end
    end
    return StructDefinition.new(type_name, field_map)
  end

  # analyze delcaration that contains global variable and function prototype declaration
  # return hash map of global variable
  def analyze_global_declaration(node)
    declarator = node.child_by_field_name('declarator')

    # peel layer of declarator to check if it's function prototype declaration
    tmp = declarator
    while
      if tmp.type == :pointer_declarator || tmp.type == :array_declarator
        tmp = tmp.child_by_field_name('declarator')
      else
        break
      end
    end

    # if it's function prototype declaration
    if tmp.field?('parameters')
      type = node.child_by_field_name('type')
      analyze_function_definition(type, declarator)
      return nil
    elsif declarator.nil?
      puts "ERROR: declarator not found in declaration"
      return nil
    end

    # extract global variable information
    gvs_map = {}
    vars = analyze_single_declaration(node)
    vars.each do |var|
      gvs_map[var.name] = var
    end

    return gvs_map
  end

  def analyze_function_definition(type_node, decl_node, body_node = nil)
    pointer_count = 0
    while(decl_node.type == :pointer_declarator)
      decl_node = decl_node.child_by_field_name('declarator')
      pointer_count += 1
    end

    fname_node = decl_node.child_by_field_name('declarator')
    fname = @code[fname_node.start_byte...fname_node.end_byte]
    ret_type = normalize_type_name(@code[type_node.start_byte...type_node.end_byte])

    plist_node = decl_node.child_by_field_name('parameters')
    params = {}
    plist_node.each_named do |child|
      if child.type == :parameter_declaration
        vars = analyze_single_declaration(child)
        vars.each {|var| params[var.name] = var}
      end
    end

    return FunctionSignature.new(ret_type, pointer_count, fname, params, body_node)
  end

  def run
    # initalize information holder

    @root.each_named do |child|
      case child.type

      # struct definition
      when :type_definition, :union_specifier, :struct_specifier
        struct_definition =  get_struct_definition(child)
        @struct_definitions.register(struct_definition) if struct_definition

      # global variable and function prototype declaration
      when :declaration
        new_gvs_map = analyze_global_declaration(child)
        unless new_gvs_map.nil?
          @gvs_map.merge!(new_gvs_map)
        end
      when :function_definition
        decl = child.child_by_field_name('declarator')
        type = child.child_by_field_name('type')
        body = child.child_by_field_name('body')
        @function_signatures.add(analyze_function_definition(type, decl, body))
      end
    end

    return
  end
end
