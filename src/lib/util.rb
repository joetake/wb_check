require 'tree_sitter'
require_relative 'classes'

def normalize_type_name(type_name)
  type_name.sub(/^union\s+/, '')
          .sub(/^struct\s+/, '')
          .sub(/^enum\s+/, '')
          .gsub(' ', '') 
end

def normalize_variable_name(str)
  str.delete!('*')
  str.gsub!(/\[.*\]/, '')
  str.gsub!(' ', '')
  return str
end

def analyze_single_declaration(node)
  vars = []
  var_type = ''
  var_names = []

  # extract type and variable name
  node.each_field do |field, child|
    case field
    when 'type'
    var_type = @code[child.start_byte...child.end_byte].strip
    when 'declarator'
      decl_node = child
      if child.field?(:value)
        decl_node = child.child_by_field_name('declarator')
      end
      var_name_str = @code[decl_node.start_byte...decl_node.end_byte].strip
      var_names << var_name_str
    end
  end

  # create CVar instance for each variable name
  var_names.each do |var_name_str|
    # count pointer
    pointer_count = var_name_str.count('*')
    
    # count parathesis 
    parenthesis_count = var_name_str.count('[')

    var_name_str = normalize_variable_name(var_name_str)
    var = CVar.new(var_type, var_name_str, pointer_count, parenthesis_count)
    vars << var
  end
  return vars
end