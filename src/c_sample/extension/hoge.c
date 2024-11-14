#include "ruby.h"

typedef struct {
    VALUE some_field;
} my_data;

static void my_data_mark(void *ptr) {
    my_data *data = (my_data *)ptr;
    rb_gc_mark(data->some_field);
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
    data->some_field = Qnil;
    return obj;
}

static VALUE rb_huga(VALUE self, VALUE src) {
    my_data *data;
    TypedData_Get_Struct(self, my_data, &my_data_type, data);

    VALUE old_value = data->some_field;
    data->some_field = src;

    RB_OBJ_WRITTEN(self, &data->some_field, src);

    return Qnil;
}


void Init_hoge() {
    VALUE cHoge = rb_define_class("Hoge", rb_cObject);
    rb_define_alloc_func(cHoge, hoge_alloc);
    rb_define_method(cHoge, "huga", rb_huga, 1);
}

