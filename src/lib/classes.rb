
def normalize_type_name(type_name)
  type_name.sub(/^union\s+/, '')
           .sub(/^struct\s+/, '')
           .sub(/^enum\s+/, '')
end
class CVar
  attr_accessor :type, :name, :pointer_count, :is_typeddata, :parent_obj

  def initialize(type, name, pointer_count)
    @type = type
    @name = name
    @pointer_count = pointer_count
    @is_typeddata = false
    @parent_obj = nil
  end

  def is_pointer?
    @pointer_count.positive?
  end

  def show
    puts "type: #{@type}, name: #{@name}, pointer count: #{@pointer_count}"
  end
end

def find_cvar(vars_in_scope, name)
  vars_in_scope.each do |var|
    return var if var.name == name
  end

  puts "ERROR: can't find \"#{name}\" in scope (while find_cvar)"
  puts "vars_in_scope: #{vars_in_scope}"
  exit
end

class StructDefinitions
  attr_accessor :list
  def initialize()
    @list = []
  end

  def register(struct_definition)
    @list << struct_definition
  end

  # get type of field from struct name and field name
  def find_field(variable_type, field_name)
    @list.each do |struct_definition|
      if struct_definition.name == variable_type
        return struct_definition.find_field(field_name)
      end
    end
    nil
  end

  def has_VALUE_element?(struct_name)
    @list.each do |struct_definition|
      if struct_definition.name == struct_name
        return struct_definition.has_VALUE_element?
      end
    end
    false
  end

  def inspect()
    if @list.size == 0
      puts "no Struct registered"
    else
      @list.each do |struct|
        struct.inspect()
      end
    end
  end
end

class StructDefinition
  attr_accessor :name, :fields
  def initialize(name, fields)
    @name = name
    @fields = fields
  end

  def find_field(field_name)
    @fields.each do |cvar|
      if cvar.name == field_name
        return cvar
      end
    end
    nil
  end

  def has_VALUE_element?
    @fields.each do |cvar|
      if cvar.type == 'VALUE'
        return true
      end
    end
    false
  end

  def inspect()
    puts "name: #{@name}"
    puts "fields:"
    @fields.each do |f, i|
      puts "#{i}: name: #{f.name}, type: #{f.type}"
    end
  end
end

class FunctionsRetType
  def initialize()
    @list = []
  end

  def register(name, type, pointer_count)
    @list << FunctionRetType.new(name, type, pointer_count)
  end

  def include?(fname)
    @list.any? {|f| f.name == fname}
  end

  def find_by_fname(fname)
    @TypeInfo.each do |frt|
      puts frt.name
      if frt.name == fname
        puts "frt.name: #{frt.name}"
        return frt
      end
    end
    nil
  end

  def inspect
    @list.each do |f|
      puts "ret_type: #{f.name}, #{f.type}, #{f.pointer_count}"
    end
  end
end

class FunctionRetType
  attr_accessor :name, :type, :pointer_count
  def initialize(name, type, pointer_count)
    @name = name
    @type = type
    @pointer_count = pointer_count
  end
end

class WriteBarrier
  attr_accessor :left_node, :left_value, :right_value, :line_number, :vars_in_scope
  def initialize(left_node, left_value, right_value, line_number, vars_in_scope)
    @left_node = left_node
    @left_value = left_value 
    @right_value = right_value
    @line_number = line_number
    @vars_in_scope = vars_in_scope
  end

  def inspect
    puts "left_value: #{@left_value}, right_value: #{@right_value}, line_number: #{@line_number}"
  end
end

class WriteBarrierList
  attr_reader :list
  def initialize()
    @list = Array.new
  end

  def add(left_node, left_value, right_value, line_number, vars_in_scope)
    @list << WriteBarrier.new(left_node, left_value, right_value, line_number, vars_in_scope)
  end

  def inspect()
    puts 'write barrier list: '
    @list.each do |w|
      w.inspect
    end
    puts "number: #{@list.size}"
  end
  
  def debug_sample()
    @list.each do |w|
      left_value = w.left_value
      left_value.gsub!(/[\(\)\*]/, '')
      data = left_value.split('->')[0]
      cvar = find_cvar(w.vars_in_scope, data)
      if cvar.nil?
        puts "while write barrrier insertion(): cvar not found"
        exit
      end

      # それぞれの引数
      old = "(VALUE)#{cvar.parent_obj}"
      oldv = '(VALUE)(((VALUE)RUBY_Qundef))'
      young = left_value
      filename = '"auto_insertion"'
      line = -1

      puts "line #{w.line_number }: rb_obj_written(#{old}, #{oldv}, #{young}, #{filename}, #{line})"
    end
  end
end

