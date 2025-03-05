
def normalize_type_name(type_name)
  type_name.sub(/^union\s+/, '')
           .sub(/^struct\s+/, '')
           .sub(/^enum\s+/, '')
end

class CVar
  attr_accessor :type, :name, :pointer_count, :is_typeddata, :parent_obj, :struct_type, :value_fields

  def initialize(type, name, pointer_count)
    @type = type
    @name = name
    @pointer_count = pointer_count
    @is_typeddata = false
    @parent_obj = nil
    @struct_type = nil  # 関連する構造体型
    @value_fields = []  # VALUEフィールドのリスト
  end

  def is_pointer?
    @pointer_count.positive?
  end

  def show
    puts "type: #{@type}, name: #{@name}, pointer count: #{@pointer_count}"
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
    @list = []  # Keep for backward compatibility
    @map = {}   # Hash map for O(1) lookups
  end

  def register(struct_definition)
    @list << struct_definition
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
  attr_accessor :name, :fields, :fields_map, :value_fields, :is_typeddata, :data_type_name
  
  def initialize(name, fields)
    @name = name
    @fields = fields  # Keep for backward compatibility
    @is_typeddata = false  # この構造体がTypedDataとして使用されるかどうか
    @data_type_name = nil  # 関連するrb_data_type_t型の名前
    
    # Create a hash map of field name -> field
    @fields_map = {}
    @value_fields = []  # VALUEフィールドのリスト
    
    fields.each do |field|
      @fields_map[field.name] = field
      @value_fields << field if field.type == 'VALUE' || field.type.include?('VALUE')
    end
  end

  def find_field(field_name)
    @fields_map[field_name]
  end

  def has_VALUE_element?
    !@value_fields.empty?
  end

  def inspect()
    puts "name: #{@name}"
    puts "is_typeddata: #{@is_typeddata}"
    puts "data_type_name: #{@data_type_name}" if @data_type_name
    puts "fields:"
    @fields.each_with_index do |f, i|
      puts "#{i}: name: #{f.name}, type: #{f.type}"
    end
    puts "VALUE fields:"
    @value_fields.each do |f|
      puts "  name: #{f.name}, type: #{f.type}"
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

class FunctionRetType
  attr_accessor :name, :type, :pointer_count
  def initialize(name, type, pointer_count)
    @name = name
    @type = type
    @pointer_count = pointer_count
  end
end

# rb_data_type_t型の定義を表すクラス
class RbDataTypeDefinition
  attr_accessor :name, :dmark, :dfree, :dsize, :flags, :parent, :struct_type
  
  def initialize(name)
    @name = name
    @dmark = nil  # マーク関数
    @dfree = nil  # 解放関数
    @dsize = nil  # サイズ計算関数
    @flags = nil  # フラグ
    @parent = nil  # 親データ型
    @struct_type = nil  # 関連する構造体型
  end
  
  def has_dmark?
    !@dmark.nil? && @dmark != "0" && @dmark != "NULL"
  end
  
  def inspect
    puts "RbDataTypeDefinition: #{@name}"
    puts "  dmark: #{@dmark}"
    puts "  dfree: #{@dfree}"
    puts "  dsize: #{@dsize}"
    puts "  flags: #{@flags}"
    puts "  parent: #{@parent}"
    puts "  struct_type: #{@struct_type}"
  end
end

# rb_data_type_t型の定義を管理するクラス
class RbDataTypeDefinitions
  attr_accessor :list, :map
  
  def initialize
    @list = []
    @map = {}  # 名前 -> 定義のマップ
  end
  
  def register(data_type_definition)
    @list << data_type_definition
    @map[data_type_definition.name] = data_type_definition
  end
  
  def find_by_name(name)
    @map[name]
  end
  
  def inspect
    puts "RbDataTypeDefinitions:"
    if @map.empty?
      puts "  No rb_data_type_t definitions registered"
    else
      @map.each_value do |dt|
        dt.inspect
      end
    end
  end
end

# 関数シグネチャを表すクラス
class FunctionSignature
  attr_accessor :name, :return_type, :parameters, :modifies_typeddata, :body_node
  
  def initialize(name, return_type)
    @name = name
    @return_type = return_type
    @parameters = []  # パラメータのリスト（型情報を含む）
    @modifies_typeddata = false  # TypedDataを変更するかどうか
    @body_node = nil  # 関数本体のノード
  end
  
  def add_parameter(param_name, param_type, pointer_count = 0)
    @parameters << {name: param_name, type: param_type, pointer_count: pointer_count}
  end
  
  def parameter_modified?(index)
    # 実装は後で追加
    false
  end
  
  def inspect
    puts "FunctionSignature: #{@name}"
    puts "  return_type: #{@return_type}"
    puts "  parameters:"
    @parameters.each_with_index do |param, i|
      puts "    #{i}: #{param[:name]} (#{param[:type]})"
    end
    puts "  modifies_typeddata: #{@modifies_typeddata}"
  end
end

# 関数シグネチャを管理するクラス
class FunctionSignatures
  attr_accessor :list, :map
  
  def initialize
    @list = []
    @map = {}  # 名前 -> シグネチャのマップ
  end
  
  def register(function_signature)
    @list << function_signature
    @map[function_signature.name] = function_signature
  end
  
  def find_by_name(name)
    @map[name]
  end
  
  def inspect
    puts "FunctionSignatures:"
    if @map.empty?
      puts "  No function signatures registered"
    else
      @map.each_value do |fs|
        fs.inspect
      end
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
      left_value = w.left_value.dup  # 元の値を変更しないようにコピーを作成
      clean_left_value = left_value.gsub(/[\(\)\*]/, '')
      data = clean_left_value.split('->')[0]
      cvar = find_cvar(w.vars_in_scope, data)
      if cvar.nil?
        puts "while write barrrier insertion(): cvar not found"
        next  # エラーの場合はスキップして次のバリアに進む
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
            # フィールドアクセスの文字列を作成
            if left_value.include?('->')
              changed_fields << "#{left_value}.#{subfield_name}"
            else
              changed_fields << "#{left_value}->#{subfield_name}"
            end
          end
        end
      end

      # 親オブジェクトの情報を取得
      parent_obj = cvar.parent_obj
      
      # TypedDataの場合、rb_data_type_tの情報を確認
      is_typeddata = cvar.is_typeddata
      data_type_name = nil
      
      if is_typeddata && struct_def = struct_definitions.find_def(normalize_type_name(cvar.type))
        data_type_name = struct_def.data_type_name
      end
      
      changed_fields.each do |changed_field|
        ctr = ctr + 1
        # それぞれの引数
        old = parent_obj ? "(VALUE)#{parent_obj}" : "Qnil"
        oldv = '(VALUE)(((VALUE)RUBY_Qundef))'
        young = changed_field
        filename = '"auto_insertion"'
        line = w.line_number
        
        # TypedDataの場合、フラグ情報を出力
        if is_typeddata && data_type_name
          puts "line #{line}: /* TypedData: #{data_type_name} */"
        end
        
        puts "line #{line}: rb_obj_written(#{old}, #{oldv}, #{young}, #{filename}, #{line})"
      end
    end
    puts "num of inserted writebarrier :#{ctr}"
  end
  
  # Get all write barriers for a specific line number
  def get_by_line(line_number)
    @map[line_number] || []
  end
end
