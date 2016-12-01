#ifndef SIZE
	#define SIZE 10
#endif

#include <stdio.h>

int main() {

	int A[SIZE][SIZE];
	int B[SIZE][SIZE];
	int C[SIZE][SIZE] = {0};

	int i, j, k, sum;

	// Taking A and B as given so ignoring these acessing

	for(i=0; i<SIZE; i++){
		for(j=0; j<SIZE; j++){
			A[i][j] = 0;
			B[i][j] = 0;
		}
	}

	int T[SIZE][SIZE];

	//Transposing B Matrix into extra memory

	for (i=0; i< SIZE; i++){
		for (j=0; j < SIZE; j++){
			T[j][i] = B[i][j];
			printf("0 %p\n", &B[i][j]);
			printf("1 %p\n", &T[j][i]);
		}
	}

	for(i=0; i<SIZE; i++){
		for(j=0; j<SIZE; j++){
			sum = 0;
			for (k=0; k< SIZE; k++){
				sum += A[i][k]*T[j][k];
				printf("0 %p\n", &A[i][k]);
				printf("0 %p\n", &T[j][k]);
			}
			C[i][j] = sum;
			printf("1 %p\n", &C[i][j]);
		}
	}

	return 0;
}