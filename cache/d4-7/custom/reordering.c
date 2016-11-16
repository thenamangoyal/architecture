#ifndef SIZE
	#define SIZE 10
#endif

#include <stdio.h>

int main() {

	int A[SIZE][SIZE];
	int B[SIZE][SIZE];
	int C[SIZE][SIZE];

	int i, j, k;

	// Taking A and B as given so ignoring these acessing

	for(i=0; i<SIZE; i++){
		for(j=0; j<SIZE; j++){
			A[i][j] = 0;
			B[i][j] = 0;
		}
	}
	
	// Reordering loop to i - k -j

	for(i=0; i<SIZE; i++){
		for(k=0; k<SIZE; k++){
			for (j=0; j< SIZE; j++){
				C[i][j] += A[i][k]*B[k][j];
				printf("0 %p\n", &A[i][k]);
				printf("0 %p\n", &B[k][j]);
				printf("0 %p\n", &C[i][j]);
				printf("1 %p\n", &C[i][j]);
			}
		}
	}

	return 0;
}