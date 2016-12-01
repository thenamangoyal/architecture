#ifndef SIZE
	#define SIZE 10
#endif

#include <stdio.h>

int min(int a, int b){
	return (a < b) ? a :b;
}

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

	// Using Blocks to multiply

	int I,J,K;

	int BS = 32/ sizeof(int);

	for(I=0; I<SIZE; I+=BS ){
		for (J=0; J< SIZE; J+=BS){
			for(K=0; K<SIZE; K+= BS){

				for(i=I; i<min(I+BS, SIZE); i++){
					for(j=J; j<min(J+BS, SIZE); j++){
						for (k=K; k< min(K+BS, SIZE); k++){
							C[i][j] += A[i][k]*B[k][j];
							printf("0 %p\n", &A[i][k]);
							printf("0 %p\n", &B[k][j]);
							printf("0 %p\n", &C[i][j]);
							printf("1 %p\n", &C[i][j]);
						}
					}
				}

			}
		}
	}

	return 0;
}