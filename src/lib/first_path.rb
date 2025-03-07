require 'tree_sitter'
require_relative 'classes'

# gather inormation about
#  - struct difinition
#  - global variable
#  - function definition
#  - rb_data_type_t type constant and their type
class FirstPath
  def initialize(root, code)
    @root = root
    @code = code
  end

  def analyze_field(node)
    vars = []
    var_type = ''
    var_names = []

    # extract type and variable name
    node.each_field do |field, child|
      case field
      when 'type'
      var_type = @code[child.start_byte...child.end_byte].strip
      when 'declarator'
        var_name_str = @code[child.start_byte...child.end_byte].strip
        var_names << var_name_str
      end
    end

    # create CVar instance for each variable name
    var_names.each do |var_name_str|
      pointer_count = var_name_str.count('*')
      var_name_str.delete!('*')
      var = CVar.new(var_type, var_name_str, pointer_count)
      vars << var
    end
    return vars
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
        vars = analyze_field(child)
        vars.each do |var|
          field_map[var.name] = var
        end
      end
    end
    return StructDefinition.new(type_name, field_map)
  end

  def run
    struct_definitions = StructDefinitions.new
    @root.each_named do |child| 
      case child.type
      when :type_definition, :union_specifier, :struct_specifier
        struct_definition =  get_struct_definition(child)
        struct_definitions.register(struct_definition) if struct_definition
      end
    end
  end
end