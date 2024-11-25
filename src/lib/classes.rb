
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
