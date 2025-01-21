#include<stdio.h>

#define VALUE int

const int hoge, **huga;
int *hoge[];

int add(int a, int b){
	int tmp = a + b;
	return tmp;
}

void swap(float* c, float* d){
	float tmp;
	tmp = *c;
	*c = *d;
	*d = tmp;

	for(i = 1; i < 5; i++){
		i = i;
	}
}

int main(){
	int i, j;
	i = 1;
	j = 3;
	i = add(i, j);
	printf("i: %d\n", i);
	
	float*    fi = 0.1;
	float *fj = 0.3;
	swap(&fi, &fj);
	printf("fi: %f, fj: %f\n", fi, fj);

	VALUE *a = 2;

	const unsigned int _a = 0;
	const VALUE userDefinedValueType;
	return 0;	
}

void changeReference(VALUE *a){
	*a = 4;

	VALUE *b = 4;
	a = b;
	return;
}


