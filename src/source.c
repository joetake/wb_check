#include<stdio.h>

#define VALUE int

int add(int a, int b){
	int tmp = a + b;
	return tmp;
}

void swap(float* c, float* d){
	float tmp;
	tmp = *c;
	*c = *d;
	*d = tmp;
}

int main(){
	int i = 1;
	int j = 3;
	i = add(i, j);
	printf("i: %d\n", i);
	
	float*    fi = 0.1;
	float *fj = 0.3;
	swap(&fi, &fj);
	printf("fi: %f, fj: %f\n", fi, fj);

	VALUE userDefinedValueType;
	return 0;	
}


