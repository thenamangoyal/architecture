#ifndef MATMATSIZE
	#define MATMATSIZE 10
#endif

#include <stdio.h>

int main() {

	int A[MATSIZE][MATSIZE];
	int B[MATSIZE][MATSIZE];
	int C[MATSIZE][MATSIZE];

	int i, j, k, sum;

	for(i=0; i<MATSIZE; i++){
		for(j=0; j<MATSIZE; j++){
			A[i][j] = 0;
			B[i][j] = 0;
		}
	}

	for(i=0; i<MATSIZE; i++){
		for(j=0; j<MATSIZE; j++){
			sum = 0;
			for (k=0; k< MATSIZE; k++){
				sum += A[i][k]*B[k][j];
				printf("0 %p\n", &A[i][k]);
				printf("0 %p\n", &B[k][j]);
			}
			C[i][j] = sum;
			printf("1 %p\n", &C[i][j]);
		}
	}

	return 0;
}