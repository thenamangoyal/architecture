#!/bin/sh

for MATRIXSIZE in 200 500
do
	gcc -DSIZE=${MATRIXSIZE} transpose.c -o transpose
	echo "-----------------------------------------"
	echo "Generating memory trace for ${MATRIXSIZE}"
	./transpose > transpose_${MATRIXSIZE}.trace
	for CACHESIZE in 16k 32k
	do
		for BLOCKSIZE in 32 64
		do
			for ASSOCIATIVITY in 1 2 4
			do
				echo "Running Dinero for ${MATRIXSIZE}_${CACHESIZE}_${BLOCKSIZE}_${ASSOCIATIVITY}"
				../dineroIV -l1-dsize ${CACHESIZE} -l1-dbsize ${BLOCKSIZE} -l1-dassoc ${ASSOCIATIVITY} -l1-dccc -informat d < transpose_${MATRIXSIZE}.trace > transpose_stat_${MATRIXSIZE}_${CACHESIZE}_${BLOCKSIZE}_${ASSOCIATIVITY}.txt
			done
		done
	done
done