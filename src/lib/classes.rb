class CVar
  attr_accessor :type, :name, :pointer_count, :parenthesis_count, :is_typeddata, :parent_obj

  def initialize(type, name, pointer_count, parenthesis_count = 0)
    @type = type
    @name = name
    @pointer_count = pointer_count
    @parenthesis_count = parenthesis_count
    @is_typeddata = false
    @parent_obj = nil
  end

  def is_array?
    @parenthesis_count.positive?
  end

  def is_pointer?
    @pointer_count.positive?
  end

  def show
    puts "type: #{@type}, name: #{@name}, pointer count: #{@pointer_count}, parenthesis count: #{@parenthesis_count}"
  end
end

def find_cvar(vars_in_scope, name)
  # If vars_in_scope is a hash, use direct lookup
  if vars_in_scope.is_a?(Hash)
    var = vars_in_scope[name]
    if var.nil?
      puts "ERROR: can't find \"#{name}\" in scope (while find_cvar)"
    end
    return var
  else
    # Fallback for when vars_in_scope is still an array
    vars_in_scope.each do |var|
      return var if var.name == name
    end
    puts "ERROR: can't find \"#{name}\" in scope (while find_cvar)"
  end
  # exit
end

class StructDefinitions
  attr_accessor :list, :map
  def initialize()
    @map = {}
  end

  def register(struct_definition)
    @map[struct_definition.name] = struct_definition
  end

  # get type of field from struct name and field name
  def find_field(variable_type, field_name)
    struct_definition = @map[variable_type]
    return struct_definition&.find_field(field_name)
  end

  def find_def(struct_name)
    puts "struct_name: #{struct_name}"
    struct_definition = @map[struct_name]
    if struct_definition.nil?
      puts "field not found"
    end
    struct_definition
  end

  def has_VALUE_element?(struct_name)
    struct_definition = @map[struct_name]
    return false if struct_definition.nil?
    struct_definition.has_VALUE_element?
  end

  def inspect()
    if @map.empty?
      puts "no Struct registered"
    else
      @map.each_value do |struct|
        struct.inspect()
      end
    end
  end
end

class StructDefinition
  attr_accessor :name, :fields, :fields_map
  def initialize(name, fields_map)
    @name = name
    @fields_map = fields_map
  end

  def find_field(field_name)
    @fields_map[field_name]
  end

  def has_VALUE_element?
    @fields.any? { |cvar| cvar.type == 'VALUE' }
  end

  def inspect()
    puts "name: #{@name}"
    puts "fields:"
    @fields_map.each_with_index do |(k, v), i|
      puts " #{i} | name: #{v.name}, type: #{v.type}"
    end
  end
end

class FunctionsRetType
  def initialize()
    @list = []  # Keep for backward compatibility
    @map = {}   # Hash map for O(1) lookups
  end

  def register(name, type, pointer_count)
    function = FunctionRetType.new(name, type, pointer_count)
    @list << function
    @map[name] = function
  end

  def include?(fname)
    @map.key?(fname)
  end

  def find_by_fname(fname)
    frt = @map[fname]
    if frt
      puts "frt.name: #{frt.name}"
    end
    frt
  end

  def inspect
    @map.each_value do |f|
      puts "ret_type: #{f.name}, #{f.type}, #{f.pointer_count}"
    end
  end
end

class FunctionSignature
  attr_accessor :ret_type, :pointer_count, :func_name, :arg_list, :body_node
  def initialize(ret_type, pointer_count, func_name, arg_list, body_node)
    @ret_type = ret_type
    @pointer_count = pointer_count
    @func_name = func_name
    @arg_list = arg_list # array
    @body_node = body_node
  end

  def has_body?
    !@body_node.nil?
  end
end

class FunctionSignatures
  def initialize()
    @fs_map = {}
  end

  def add(fs)
    key = fs.func_name

    # Do not overwrite if already registered and has a body
    return if @fs_map.key?(key) && !@fs_map[key].has_body?
    @fs_map[key] = fs
  end

  def find_by_fname(body_node)

  end

  def inspect()
    @fs_map.each_value do |fs|
      puts "registerd function: #{fs.func_name}, has_body: #{fs.has_body?}"
      # puts "ret_type: #{fs.ret_type}, func_name: #{fs.func_name}, pointer_count: #{fs.pointer_count}"
      # fs.arg_list.each do |arg|
      #   puts "arg: #{arg.type} #{arg.name}"
      # end
    end
  end
end

class WriteBarrier
  attr_accessor :left_node, :left_value, :right_value, :line_number, :vars_in_scope, :type_name
  def initialize(left_node, left_value, right_value, line_number, vars_in_scope, type_name)
    @left_node = left_node
    @left_value = left_value 
    @right_value = right_value
    @line_number = line_number
    @vars_in_scope = vars_in_scope
    @type_name = type_name
  end

  def inspect
    puts "left_value: #{@left_value}, right_value: #{@right_value}, line_number: #{@line_number}"
  end
end

class WriteBarrierList
  attr_reader :list, :map
  def initialize()
    @list = []  # Keep for backward compatibility
    @map = {}   # Hash map for faster lookups by line number
  end

  def add(left_node, left_value, right_value, line_number, vars_in_scope, type_name)
    barrier = WriteBarrier.new(left_node, left_value, right_value, line_number, vars_in_scope, type_name)
    @list << barrier
    
    # Store by line number for faster lookups
    @map[line_number] ||= []
    @map[line_number] << barrier
  end

  def inspect()
    puts 'write barrier list: '
    @list.each do |w|
      w.inspect
    end
    puts "number: #{@list.size}"
  end
  
  def debug_sample(struct_definitions)
    ctr = 0
    @list.each do |w|
      left_value = w.left_value
      left_value.gsub!(/[\(\)\*]/, '')
      data = left_value.split('->')[0]
      cvar = find_cvar(w.vars_in_scope, data)
      if cvar.nil?
        puts "while write barrrier insertion(): cvar not found"
        exit
      end

      changed_fields = []
      if w.type_name == 'VALUE'
        changed_fields << left_value
      else
        struct_def = struct_definitions.find_def(w.type_name)
        if struct_def
          struct_def.fields.each do |fld|
            next unless normalize_type_name(fld.type) == "VALUE"
            subfield_name = fld.name  # "a", "b", etc.
            # 3. "ptr->structfield.a" の文字列を作成
            changed_fields << "#{w.left_value}.#{subfield_name}"
          end
        end
      end

      changed_fields.each do |changed_field|
        ctr = ctr + 1
        # それぞれの引数
        old = "(VALUE)#{cvar.parent_obj}"
        oldv = '(VALUE)(((VALUE)RUBY_Qundef))'
        young = changed_field
        filename = '"auto_insertion"'
        line = -1

        puts "line #{w.line_number }: rb_obj_written(#{old}, #{oldv}, #{young}, #{filename}, #{line})"
      end
    end
    puts "num of inserted writebarrier :#{ctr}"
  end
  
  # Get all write barriers for a specific line number
  def get_by_line(line_number)
    @map[line_number] || []
  end
end