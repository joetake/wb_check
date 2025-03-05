require 'tree_sitter'
require_relative 'classes'

# $struct_definitions = StructDefinitions.new
# $functions_ret_type = FunctionsRetType.new

# list of global variables

class Analyzer
  LHS_NIL_RESULT = {type_name: nil, is_pointer_access: false, is_typeddata: false, needWB: false}
  LHS_WB_RESULT = {type_name: nil, is_pointer_access: true, is_typeddata: true, needWB: true}


  def initialize(path_to_source, path_to_parser)
    @path_to_source = path_to_source
    @path_to_parser = path_to_parser
    @number_of_found_declarator = 0
    @wb_list = WriteBarrierList.new

    # 型情報の管理
    @struct_definitions = StructDefinitions.new
    @functions_ret_type = FunctionsRetType.new
    @rb_data_type_definitions = RbDataTypeDefinitions.new
    @function_signatures = FunctionSignatures.new
    @grobalv = {}
    
    # 解析状態の管理
    @current_pass = 1  # 現在のパス番号
    @total_passes = 4  # 合計パス数
  end
  
  # find rb_check_typeddata()'s node recursively , return found node
  def find_typedthing_call(node, code)
    call = nil
    node.each_named do |child|
      str = code[child.start_byte...child.end_byte]
      if child.named_child_count > 0
      call = find_typedthing_call(child, code)
      end
      if child.type == :call_expression && str.include?('rb_check_typeddata')
        call = child
      end
    end
    return call
  end

  def process_lhs(node, code, vars_in_scope)
    puts node.type
    case node.type
    when :identifier
      name = code[node.start_byte...node.end_byte]
      name.gsub!(/[\(\)\*]/, '')
      puts "name: #{name}"
      cvar = find_cvar(vars_in_scope, name)

      # 一時的！！！
      return LHS_NIL_RESULT if cvar.nil?
      type_name = cvar.type
      if type_name.split(' ').size > 1
        type_name = type_name.split(' ').last
      end
      return {type_name: type_name, is_pointer_access: false, is_typeddata: cvar.is_typeddata, needWB: false}
    when :field_expression
      operator_node = node.child_by_field_name('operator')
      operator = code[operator_node.start_byte...operator_node.end_byte]
      puts operator
      argument = node.child_by_field_name('argument')
      field = node.child_by_field_name('field')
      puts "argument: #{argument}"
      argument_info = process_lhs(argument, code, vars_in_scope)

      unless argument_info[:is_typeddata]
        return LHS_NIL_RESULT
      end

      # check field
      field_info = nil
      if field.type == :field_identifier
        field_name = code[field.start_byte...field.end_byte]
        puts "#{argument_info[:type_name]}, #{field_name}"
        field_cvar = @struct_definitions.find_field(argument_info[:type_name], field_name)
        field_info = {type_name: field_cvar.type, is_pointer_access: false, is_typeddata: false, needWB: false}
      else
        field_info = process_lhs(field, code, vars_in_scope)
        # if field expression in field is needWB: true return immediately
        return field_info if field_info[:needWB]
      end

      expected_access = (operator == '->') || (operator == '.' && argument_info[:is_pointer_access])
      new_type_name = normalize_type_name(field_info[:type_name])
      # check WBneed or not
      if new_type_name == 'VALUE' && expected_access
        return {type_name: 'VALUE', is_pointer_access: true, is_typeddata: false, needWB: true}
      else

        # check struct in field has VALUE element or not
        puts "field_type: #{new_type_name}"
        has_VALUE_element = @struct_definitions.has_VALUE_element?(new_type_name)
        puts "has_VALUE_element?: #{has_VALUE_element}"

        # if it isn't struct or not expected access, return as needWB: false
        unless has_VALUE_element
          return {type_name: new_type_name, is_pointer_access: field_info[:is_pointer_access], is_typeddata: argument_info[:is_typeddata], needWB: false}
        end

        return {type_name: new_type_name, is_pointer_access: true, is_typeddata: true, needWB: true}
      end

    when :pointer_expression
      child = node.child_by_field_name('argument')
      result = process_lhs(child, code, vars_in_scope)
      result[:is_pointer_access] = true
      return result
    when :parenthesized_expression
      inner = node.named_child(0)
      return process_lhs(inner, code, vars_in_scope)

    when :assignment_expression
      inner = node.named_child(1)
      return process_lhs(inner, code, vars_in_scope)
    # when :call_expression, :cast_expression, :binary_expression, :subscript_expression
    #   return LHS_NIL_RESULT
    else
      return LHS_NIL_RESULT
    end
  end

  # check :declaration, return defined variables or fields
  def search_declaration(node, code)
    vars = {}  # Use hash map instead of array
    var_types = []
    var_names = []
    puts node
    node.each_named do |child|
      case child.type
      when :field_declaration
        type_node = child.child_by_field_name('type')
        declarator_node = child.child_by_field_name('declarator')
        if type_node && declarator_node
          var_type_str = code[type_node.start_byte...type_node.end_byte].strip
          var_name_str = code[declarator_node.start_byte...declarator_node.end_byte].strip
          pointer_count = var_name_str.count('*')
          var_name_str.delete!('*')

          var = CVar.new(var_type_str, var_name_str, pointer_count)
          vars[var_name_str] = var
        end
      when :primitive_type, :type_identifier, :sized_type_specifier
        var_types << code[child.start_byte...child.end_byte]

      # locate variable name, no initialization
      when :identifier, :pointer_declarator, :field_identifier
        var_names << code[child.start_byte...child.end_byte]
      when :array_declarator
        var_names << code[child.start_byte...child.end_byte].gsub(/\[\w+\]/, "*")

      # locate variable name, has initialization
      when :init_declarator
        declarator = child.child_by_field_name('declarator')
        var_names << code[declarator.start_byte...declarator.end_byte]
      when :poiinter_declarator

      # others
      when :union_specifier, :struct_specifier
        var_types << code[child.start_byte...child.end_byte]
      when :comment , :storage_class_specifier, :type_qualifier

      # only for debug
      # else
      #   puts "!! child type: #{child.type}"
      #   puts code[child.start_byte...child.end_byte]
      #   puts child
      #   exit
      end
    end
    pointer_count = 0
    if var_types.size == 1 && var_names.size > 0 && vars.empty?
      var_type = var_types[0]
      var_names.each do |var_name|
        var_name.gsub!(' ', '')
        pointer_count = 0

        var_name.each_char do |c|
          pointer_count += 1 if c == '*'
        end
        var_name.gsub!('*', '')
        var = CVar.new(var_type, var_name, pointer_count)
        var.show
        vars[var_name] = var
      end
      puts "!pointer_count: #{pointer_count}"
    elsif var_types.size == var_names.size && var_names.size > 0 && vars.empty?
      var_names.each_with_index do |var_name, i|
        var_name.gsub!(' ', '')
        pointer_count = 0

        var_name.each_char do |c|
          pointer_count += 1 if c == '*'
        end
        var_name.gsub!('*', '')
        var = CVar.new(var_types[i], var_name, pointer_count)
        vars[var_name] = var
      end
    # else
    #   exit
    end
    return vars
  end

  # 3rd depth
  # check :expression
  def search_expression(node, code, vars_in_scope)
    node.each_named do |child|
      if child.type == :assignment_expression
        puts child
        right = child.child_by_field_name('right')
        right_value = code[right.start_byte...right.end_byte]
        left = child.child_by_field_name('left')
        left_value = code[left.start_byte...left.end_byte]
        line_number = child.start_point.row + 1
        puts "        line: #{line_number}"

        if right_value.include?('rb_check_typeddata')
          # 改善: rb_check_typeddataの呼び出しパターンを直接認識
          # 左辺から変数名を抽出
          var_name = left_value.gsub(/[\(\)\*\s]/, '').strip
          cvar = find_cvar(vars_in_scope, var_name)

          if cvar.nil?
            puts "search_expression(): cvar not found"
            if vars_in_scope.is_a?(Hash)
              vars_in_scope.each_value do |cv|
                cv.show
              end
            else
              vars_in_scope.each do |cv|
                cv.show
              end
            end
            exit
          end

          cvar.is_typeddata = true

          # rb_check_typeddataの第1引数（親オブジェクト）を抽出
          call = find_typedthing_call(right, code)
          if call
            arguments = call.child_by_field_name('arguments')
            if arguments && arguments.named_child_count >= 1
              first_arg = arguments.named_child(0)
              parent_obj = code[first_arg.start_byte...first_arg.end_byte]
              puts "Parent object: #{parent_obj}"
              cvar.parent_obj = parent_obj
            end
          end
          
          # rb_check_typeddataの第2引数（rb_data_type_t）を抽出
          data_type_match = right_value.match(/rb_check_typeddata\([^,]+,\s*\(?&([^)]+)\)?/)
          if data_type_match
            data_type_name = data_type_match[1].strip
            puts "Data type: #{data_type_name}"
            
            # 左辺の型を抽出（例：union DateData *）
            type_match = left_value.match(/([^=]+)\*/)
            if type_match
              struct_type = normalize_type_name(type_match[1].strip)
              update_typeddata_association(data_type_name, struct_type)
            end
          end
        end

        result = process_lhs(left, code, vars_in_scope)
        puts "result: #{result}"

        if result[:needWB]
          puts "        WRITEBARRIER on fire"
          @wb_list.add(left, left_value, right_value, line_number, vars_in_scope, result[:type_name])
        end
      else
        search_expression(child, code, vars_in_scope)
      end
    end
  end
  
  # 2nd depth
  # check child node of :compound_statement, if, while, etc
  def search_inside_block(node, code, _vars_in_bscope)
    #  to not interfere the original hash
    vars_in_bscope = _vars_in_bscope.is_a?(Hash) ? _vars_in_bscope.dup : _vars_in_bscope.dup

    # for statement might declarate index variable
    if node.type == :for_statement
      declarator = node.child_by_field_name('initializer')
      if declarator && declarator.type == :declaration
        vars = search_declaration(declarator, code)
        if vars_in_bscope.is_a?(Hash)
          vars_in_bscope.merge!(vars)
        else
          # Convert old array to hash if needed
          new_vars = {}
          vars_in_bscope.each do |var|
            new_vars[var.name] = var
          end
          vars.each do |name, var|
            new_vars[name] = var
          end
          vars_in_bscope = new_vars
        end
      end
    end

    node.each do |child|
      line_number = child.start_point.row + 1
      puts "line: #{line_number}, inside block: #{child.type}"

      case child.type

      # find the part of defining Variable
      when :declaration
        vars = search_declaration(child, code)

        # Merge the new variables into the scope
        if vars_in_bscope.is_a?(Hash)
          vars_in_bscope.merge!(vars)
        else
          # Convert old array to hash if needed
          new_vars = {}
          vars_in_bscope.each do |var|
            new_vars[var.name] = var
          end
          vars.each do |name, var|
            new_vars[name] = var
          end
          vars_in_bscope = new_vars
        end

      # find the part of Expression
      when :expression_statement
        # Combine local and global variables
        if vars_in_bscope.is_a?(Hash) && @grobalv.is_a?(Hash)
          vars_in_scope = vars_in_bscope.merge(@grobalv)
        else
          # Fallback for backward compatibility
          vars_in_scope = Array(vars_in_bscope).concat(Array(@grobalv))
        end
        search_expression(child, code, vars_in_scope)
      when :if_statement, :else_clause, :compound_statement, :for_statement, :while_statement, :do_statement, :switch_statement
        search_inside_block(child, code, vars_in_bscope)
      end
    end
  end

  # 2nd depth
  # check child node of :functin_declarator
  def search_function_declarator(node, code)
    args = {} 

    node.each_named do |child|
      puts "    child: #{child.type}"

      # the part of arguments
      case child.type
      when :pointer_declarator
        params = search_function_declarator(child, code)
        args.merge!(params)
      when :parameter_list
        if child.named_child_count == 1
          declaration_node = child.named_child(0)
          type_node = declaration_node.child_by_field_name('type')
          puts type_node.type if type_node
          if type_node && type_node.type == :primitive_type
            param_text = code[type_node.start_byte...type_node.end_byte].strip
            # has no param
            if param_text == "void"
              return args
            end
          end
        end

        child.each_named do |param|
          if param.type == :parameter_declaration

            # get type and name
            type = param.child_by_field_name('type')
            declarator = param.child_by_field_name('declarator')

            next unless type && declarator

            var_type = code[type.start_byte...type.end_byte]
            var_name = code[declarator.start_byte...declarator.end_byte]

            # count pointer
            pointer_count = var_name.count('*')
            var_name.delete!('*')
            var_type.strip!
            var_name.strip!

            var = CVar.new(var_type, var_name, pointer_count)
            args[var_name] = var
          end
        end
      end
    end
    return args
  end

  # 1st depth
  # check child node of :function_definition
  def search_function(node, code)

    # 関数スコープ内にある変数を管理
    vars_in_bscope = {}  # Use hash map instead of array
    puts node
    node.each_named do |child|
      puts "  Function's child: #{child.type}"
      case child.type
      when :storage_class_specifier, :type_qualifier

      # return type
      when :primitive_type, :type_identifier
        type_str = code[child.start_byte...child.end_byte]
        pointer_count = type_str.count('*')
        type_str.delete!('*')
        f_declarator = node.child_by_field_name('declarator')

        # pointer_declaratorがネストしている場合があるので降りていく
        while f_declarator && f_declarator.type == :pointer_declarator
          pointer_count += 1  # "char *" が更に "*" 等で深い階層にある場合
          # 次の段階へ潜る
          f_declarator = f_declarator.child_by_field_name('declarator')
        end

        # 3) f_declarator 下から実際のidentifierを取得
        if f_declarator
          # もし function_declarator ならさらに同様に潜る
          while f_declarator.type == :function_declarator
            f_declarator = f_declarator.child_by_field_name('declarator')
          end
        end

        if f_declarator
          f_name = code[f_declarator.start_byte...f_declarator.end_byte]
          f_name.strip!
          if @functions_ret_type.include?(f_name)
            next
          end
          @functions_ret_type.register(f_name, type_str, pointer_count)
        end

      # deep into Function Declarator
      when :function_declarator, :pointer_declarator
        puts "  function_declarator's child: #{child}"
        params = search_function_declarator(child, code)
        vars_in_bscope.merge!(params)
        puts "params: #{params}"

      # deep into Function Body
      when :compound_statement
        search_inside_block(child, code, vars_in_bscope)
      end
    end
  end

  # 1st depth
  # check child node of :type_definition
  def search_type_definition(node, code)

    puts node
    # check the definition of field
    case node.type
    when :type_definition
      type_name = node.child_by_field_name('declarator')
      struct_node = node.child_by_field_name('type')&.child_by_field_name('body')
    when :struct_specifier, :union_specifier
      type_name = node.child_by_field_name('name')
      struct_node = node.child_by_field_name('body')
    end
    
    return unless type_name && struct_node
    
    type_name = code[type_name.start_byte...type_name.end_byte]

    # is struct or union definition
    if struct_node
      field_hash = {}
      struct_node.each_named do |c|
        fields = search_declaration(c, code)
        field_hash.merge!(fields)
      end

      # Convert hash to array for backward compatibility
      field_list = field_hash.values

      # register definition of struct
      struct_definition = StructDefinition.new(type_name, field_list)
      @struct_definitions.register(struct_definition)
    end
  end

  # 1st depth, function proto definition or global
  # ロジックがぐちゃぐちゃなので整理したい
  def search_func_proto(node, code)
    puts node
    function_decl = node.child_by_field_name('declarator')

    # detect grobal variable declaration
    if function_decl.nil? || function_decl.type != :function_declarator
      gvs = search_declaration(node, code)
      if @grobalv.is_a?(Hash)
        @grobalv.merge!(gvs)
      else
        # Convert old array to hash if needed
        new_gvs = {}
        @grobalv.each do |var|
          new_gvs[var.name] = var
        end
        gvs.each do |name, var|
          new_gvs[name] = var
        end
        @grobalv = new_gvs
      end
      return
    end

    if function_decl.type != :function_declarator && function_decl.type != :pointer_declarator
      puts "unexpected node detected"
    end

    if function_decl.type == :pointer_declarator
      function_decl = function_decl.child_by_field_name('declarator')
    end
    type_node = node.child_by_field_name('type')
    if type_node.nil?
      type_node = node.child_by_field_name('declartor')
      exit
    end

    type_str = code[type_node.start_byte...type_node.end_byte]
    pointer_count = type_str.count('*')
    type_str.delete!('*')

    func_id_node = function_decl.child_by_field_name('declarator')
    puts "type_str: #{type_str}, pointer_count: #{pointer_count}"
    return if func_id_node.nil?
    func_name = code[func_id_node.start_byte...func_id_node.end_byte]

    @functions_ret_type.register(func_name.strip, type_str.strip, pointer_count)
  end

  # rb_data_type_t型の定義を検索する
  def search_rb_data_type_definition(node, code)
    # 変数宣言を探す
    if node.type == :declaration
      # 型が rb_data_type_t かどうかを確認
      type_node = node.child_by_field_name('type')
      return unless type_node
      
      type_str = code[type_node.start_byte...type_node.end_byte]
      return unless type_str.include?('rb_data_type_t')
      
      # 変数名を取得
      declarator = node.child_by_field_name('declarator')
      return unless declarator
      
      var_name = code[declarator.start_byte...declarator.end_byte].strip
      
      # 初期化式があるか確認
      init_node = declarator.child_by_field_name('value')
      if !init_node && declarator.type == :init_declarator
        init_node = declarator.child_by_field_name('value')
      end
      
      # rb_data_type_t型の定義を作成
      data_type_def = RbDataTypeDefinition.new(var_name)
      
      # 初期化式から情報を抽出
      if init_node
        # 初期化式の内容を解析
        parse_rb_data_type_initializer(init_node, code, data_type_def)
      end
      
      # 登録
      @rb_data_type_definitions.register(data_type_def)
      puts "Found rb_data_type_t: #{var_name}"
    end
  end
  
  # rb_data_type_t型の初期化式を解析する
  def parse_rb_data_type_initializer(init_node, code, data_type_def)
    # 初期化式の内容を取得
    init_str = code[init_node.start_byte...init_node.end_byte]
    
    # 名前フィールドを抽出
    name_match = init_str.match(/"([^"]+)"/)
    data_type_def.name = name_match[1] if name_match
    
    # dmark関数を抽出
    dmark_match = init_str.match(/dmark\s*[,:]\s*([^,}]+)/)
    data_type_def.dmark = dmark_match[1].strip if dmark_match
    
    # dfree関数を抽出
    dfree_match = init_str.match(/dfree\s*[,:]\s*([^,}]+)/)
    data_type_def.dfree = dfree_match[1].strip if dfree_match
    
    # dsize関数を抽出
    dsize_match = init_str.match(/dsize\s*[,:]\s*([^,}]+)/)
    data_type_def.dsize = dsize_match[1].strip if dsize_match
    
    # フラグを抽出
    flags_match = init_str.match(/flags\s*[,:]\s*([^,}]+)/)
    data_type_def.flags = flags_match[1].strip if flags_match
    
    # 親データ型を抽出
    parent_match = init_str.match(/parent\s*[,:]\s*([^,}]+)/)
    data_type_def.parent = parent_match[1].strip if parent_match
  end
  
  # rb_check_typeddata関数の呼び出しを解析して、TypedDataと構造体型の関連付けを行う
  def analyze_rb_check_typeddata_calls(node, code)
    # 直接パターンを認識する方法を試す
    recognize_typeddata_pattern(node, code)
    
    # 従来の再帰的な探索も行う
    node.each_named do |child|
      if child.type == :call_expression
        function_name = code[child.child_by_field_name('function').start_byte...child.child_by_field_name('function').end_byte]
        
        if function_name == 'rb_check_typeddata'
          arguments = child.child_by_field_name('arguments')
          if arguments && arguments.named_child_count >= 2
            # 第2引数がrb_data_type_tへのポインタ
            data_type_arg = arguments.named_child(1)
            data_type_name = code[data_type_arg.start_byte...data_type_arg.end_byte].strip
            data_type_name.gsub!(/[&\(\)\s]/, '')  # '&'と括弧と空白を削除
            
            # 親ノードを調査して代入式を見つける
            parent = find_parent_assignment(child, code)
            if parent && parent.type == :assignment_expression
              left = parent.child_by_field_name('left')
              
              # 左辺から構造体型を直接抽出
              if left
                left_str = code[left.start_byte...left.end_byte]
                # 型キャストを含む場合（例：((union DateData *)rb_check_typeddata(...))）
                struct_type_match = left_str.match(/\(\(([^*]+)\*\)/)
                if struct_type_match
                  struct_type = normalize_type_name(struct_type_match[1].strip)
                  update_typeddata_association(data_type_name, struct_type)
                else
                  # 変数名から型を特定する従来の方法
                  var_name = left_str.gsub(/[\(\)\*\s]/, '').strip
                  var_decl = find_variable_declaration(var_name, code)
                  if var_decl
                    struct_type = normalize_type_name(var_decl.type)
                    update_typeddata_association(data_type_name, struct_type)
                  end
                end
              end
            end
          end
        end
      end
      
      # 再帰的に探索
      if child.named_child_count > 0
        analyze_rb_check_typeddata_calls(child, code)
      end
    end
  end
  
  # rb_check_typeddata呼び出しパターンを直接認識する
  def recognize_typeddata_pattern(node, code)
    if node.type == :assignment_expression
      right = node.child_by_field_name('right')
      left = node.child_by_field_name('left')
      
      if right && left
        right_str = code[right.start_byte...right.end_byte]
        left_str = code[left.start_byte...left.end_byte]
        
        # rb_check_typeddataを含む代入パターンを検出
        if right_str.include?('rb_check_typeddata')
          # 左辺から変数名を抽出
          var_name = left_str.gsub(/[\(\)\*\s]/, '').strip
          
          # rb_check_typeddataの第2引数（rb_data_type_t）を抽出
          data_type_match = right_str.match(/rb_check_typeddata\([^,]+,\s*\(?&([^)]+)\)?/)
          if data_type_match
            data_type_name = data_type_match[1].strip
            
            # 左辺の型を抽出（例：union DateData *）
            # 直接の型指定がある場合
            type_match = left_str.match(/([^=]+)\*/)
            if type_match
              struct_type = normalize_type_name(type_match[1].strip)
              update_typeddata_association(data_type_name, struct_type)
            else
              # 変数名から型を特定
              var_decl = find_variable_declaration(var_name, code)
              if var_decl
                struct_type = normalize_type_name(var_decl.type)
                update_typeddata_association(data_type_name, struct_type)
              end
            end
          end
        end
      end
    end
    
    # 子ノードも再帰的に処理
    node.each_named do |child|
      recognize_typeddata_pattern(child, code)
    end
  end
  
  # TypedDataと構造体型の関連付けを更新
  def update_typeddata_association(data_type_name, struct_type)
    data_type_def = @rb_data_type_definitions.find_by_name(data_type_name)
    if data_type_def
      data_type_def.struct_type = struct_type
      
      struct_def = @struct_definitions.find_def(struct_type)
      if struct_def
        struct_def.is_typeddata = true
        struct_def.data_type_name = data_type_name
      end
    end
  end
  
  # 親の代入式を探す（改善版）
  def find_parent_assignment(node, code)
    # 直接の親が代入式かチェック
    parent = node.parent
    if parent && parent.type == :assignment_expression
      return parent
    end
    
    # キャスト式を通して親を探す
    parent = node.parent
    while parent
      if parent.type == :cast_expression
        parent = parent.parent
        next
      elsif parent.type == :assignment_expression
        return parent
      else
        break
      end
    end
    
    # 代入式が見つからない場合、周囲のコンテキストを調査
    # 例：union DateData *adat; ((adat) = ((union DateData *)rb_check_typeddata((self), (&d_lite_type))));;
    # この場合、変数宣言と代入が別々になっている
    
    return nil
  end
  
  # 変数の宣言を探す
  def find_variable_declaration(var_name, code)
    # この実装は簡略化されています。実際には変数のスコープを考慮する必要があります。
    @grobalv[var_name]
  end
  
  # 関数シグネチャを収集する
  def collect_function_signatures(node, code)
    if node.type == :function_definition
      # 関数名を取得
      f_name = extract_function_name(node, code)
      return unless f_name
      
      # 戻り値の型を取得
      return_type = nil
      node.each_named do |child|
        if child.type == :primitive_type || child.type == :type_identifier
          return_type = code[child.start_byte...child.end_byte]
          break
        end
      end
      return unless return_type
      
      # 関数シグネチャを作成
      function_signature = FunctionSignature.new(f_name, return_type)
      
      # パラメータを取得
      f_declarator = node.child_by_field_name('declarator')
      if f_declarator && f_declarator.type == :function_declarator
        parameter_list = f_declarator.child_by_field_name('parameter_list')
        if parameter_list
          parameter_list.named_children.each do |param|
            if param.type == :parameter_declaration
              type_node = param.child_by_field_name('type')
              declarator = param.child_by_field_name('declarator')
              
              if type_node && declarator
                param_type = code[type_node.start_byte...type_node.end_byte]
                param_name = code[declarator.start_byte...declarator.end_byte]
                
                # ポインタ数をカウント
                pointer_count = param_name.count('*')
                param_name.gsub!(/[\*\s]/, '')
                
                function_signature.add_parameter(param_name, param_type, pointer_count)
              end
            end
          end
        end
      end
      
      # 関数本体のノードを保存
      body_node = node.child_by_field_name('body')
      function_signature.body_node = body_node if body_node
      
      # 登録
      @function_signatures.register(function_signature)
      puts "Found function signature: #{f_name}"
    end
  end
  
  # 関数名を抽出する
  def extract_function_name(function_node, code)
    declarator = function_node.child_by_field_name('declarator')
    return nil if declarator.nil?
    
    # ネストした宣言子を辿る
    current = declarator
    while current && (current.type == :function_declarator || current.type == :pointer_declarator)
      if current.type == :function_declarator
        current = current.child_by_field_name('declarator')
      elsif current.type == :pointer_declarator
        current = current.child_by_field_name('declarator')
      end
      break if current.nil?
    end
    
    return nil if current.nil?
    
    # 関数名を取得
    code[current.start_byte...current.end_byte].strip
  end
  
  # 第1パス: 型定義の収集
  def first_pass(root, code)
    puts "=== First Pass: Collecting Type Definitions ==="
    
    root.each_named do |child|
      line_number = child.start_point.row + 1
      
      case child.type
      when :declaration
        # rb_data_type_t型の定義を検索
        search_rb_data_type_definition(child, code)
        
        # グローバル変数と関数プロトタイプ
        search_func_proto(child, code)
        
      when :type_definition, :struct_specifier, :union_specifier
        # 構造体定義
        search_type_definition(child, code)
        
      when :function_definition
        # 関数シグネチャを収集
        collect_function_signatures(child, code)
      end
    end
    
    # 結果を表示
    puts "Found #{@rb_data_type_definitions.list.size} rb_data_type_t definitions"
    puts "Found #{@struct_definitions.list.size} struct definitions"
    puts "Found #{@function_signatures.list.size} function signatures"
  end
  
  # 第2パス: 型の関連付け
  def second_pass(root, code)
    puts "=== Second Pass: Associating Types ==="
    
    # rb_check_typeddata関数の呼び出しを解析
    analyze_rb_check_typeddata_calls(root, code)
    
    # 結果を表示
    typeddata_structs = @struct_definitions.list.select { |s| s.is_typeddata }
    puts "Found #{typeddata_structs.size} TypedData structs"
  end
  
  # 第3パス: 関数解析
  def third_pass(root, code)
    puts "=== Third Pass: Analyzing Functions ==="
    
    # 関数本体を解析
    # この実装は後で追加
    
    puts "Function analysis not yet implemented"
  end
  
  # 第4パス: ライトバリアポイントの特定
  def fourth_pass(root, code)
    puts "=== Fourth Pass: Identifying Write Barrier Points ==="
    
    # 現在の実装と同様に代入式を解析
    root.each_named do |child|
      line_number = child.start_point.row + 1
      
      case child.type
      when :function_definition
        search_function(child, code)
      end
    end
    
    # TypedDataオブジェクトに対するライトバリアの最適化
    optimize_typeddata_write_barriers
    
    # 結果を表示
    @wb_list.inspect
    @wb_list.debug_sample(@struct_definitions)
  end
  
  # TypedDataオブジェクトに対するライトバリアを最適化する
  def optimize_typeddata_write_barriers
    puts "Optimizing write barriers for TypedData objects..."
    
    # rb_data_type_tのフラグを確認
    @rb_data_type_definitions.list.each do |data_type_def|
      # RUBY_TYPED_WB_PROTECTEDフラグが設定されているか確認
      if data_type_def.flags && data_type_def.flags.include?('RUBY_TYPED_WB_PROTECTED')
        puts "TypedData with WB_PROTECTED flag: #{data_type_def.name}"
        
        # 関連する構造体を取得
        struct_type = data_type_def.struct_type
        next unless struct_type
        
        struct_def = @struct_definitions.find_def(struct_type)
        next unless struct_def
        
        # この構造体に関連するライトバリアポイントを最適化
        optimize_struct_write_barriers(struct_def, data_type_def)
      end
    end
  end
  
  # 特定の構造体に対するライトバリアを最適化する
  def optimize_struct_write_barriers(struct_def, data_type_def)
    puts "Optimizing write barriers for struct: #{struct_def.name}"
    
    # VALUEフィールドを持つ構造体のみ処理
    return unless struct_def.has_VALUE_element?
    
    # ライトバリアリストを走査して最適化
    @wb_list.list.each do |barrier|
      # この構造体に関連するバリアかどうかを確認
      if barrier.type_name == struct_def.name || 
         (barrier.type_name == 'VALUE' && barrier.left_value.include?(struct_def.name))
        
        # 親オブジェクトの情報を更新
        left_value = barrier.left_value
        if left_value.include?('->')
          # フィールドアクセスの場合、親オブジェクトを特定
          parent_obj = left_value.split('->').first
          parent_obj.gsub!(/[\(\)\*\s]/, '')
          
          # 変数情報を取得
          cvar = find_cvar(barrier.vars_in_scope, parent_obj)
          if cvar && cvar.is_typeddata && cvar.parent_obj
            puts "Updated parent object for barrier at line #{barrier.line_number}: #{cvar.parent_obj}"
          end
        end
      end
    end
  end
  
  # initiate program
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

    # 複数パスで解析を実行
    puts '==================================='
    
    # 第1パス: 型定義の収集
    first_pass(root, src)
    
    # 第2パス: 型の関連付け
    second_pass(root, src)
    
    # 第3パス: 関数解析
    # third_pass(root, src)
    
    # 第4パス: ライトバリアポイントの特定
    fourth_pass(root, src)
    
    puts '==================================='
    puts "success"
  end
end
