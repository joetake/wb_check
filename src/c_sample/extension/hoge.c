#include "ruby.h"
#include "./hoge.h"

typedef struct {
    int id;
    VALUE field1;
    VALUE field2;
} my_data;

static void my_data_mark(void *ptr) {
    my_data *data = (my_data *)ptr;
    rb_gc_mark(data->id);
    rb_gc_mark(data->field1);
    rb_gc_mark(data->field2);
}

static void my_data_free(void *ptr) {
    xfree(ptr);
}

static size_t my_data_size(const void *ptr) {
    return sizeof(my_data);
}

static const rb_data_type_t my_data_type = {
    "my_data",
    {
        my_data_mark,
        my_data_free,
        my_data_size,
    },
    0, 0, RUBY_TYPED_FREE_IMMEDIATELY,
};

static VALUE hoge_alloc(VALUE klass) {
    my_data *data;
    VALUE obj = TypedData_Make_Struct(klass, my_data, &my_data_type, data);
    data->id = Qnil;
    data->field1 = Qnil;
    data->field2 = Qnil;
    return obj;
}

static VALUE rb_huga(VALUE self, VALUE src) {
    my_data *data;
    TypedData_Get_Struct(self, my_data, &my_data_type, data);

    VALUE old_value = data->field1;
    data->field1 = src;

    RB_OBJ_WRITTEN(self, &data->field1, src);

    VALUE array[11][2];
    array[1] = old_value;
    return Qnil;
}


void Init_hoge() {
    VALUE cHoge = rb_define_class("Hoge", rb_cObject);
    rb_define_alloc_func(cHoge, hoge_alloc);
    rb_define_method(cHoge, "huga", rb_huga, 1);
}

