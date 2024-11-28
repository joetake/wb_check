
class CVar
  attr_accessor :type, :name, :pointer_count

  def initialize(type, name, pointer_count)
    @type = type
    @name = name
    @pointer_count = pointer_count
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
  end
end

class WriteBarrier
  attr_accessor :old, :new, :line_number
  def initialize(old, new, line_number)
    @old = old
    @new = new
    @line_number = line_number
  end
end

class WriteBarrierList
  attr_reader :list
  def initialize()
    @list = Array.new
  end

  def add(old, new, line_number)
    @list << WriteBarrier.new(old, new, line_number)    
  end
end
