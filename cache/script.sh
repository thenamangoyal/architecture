#!/bin/bash
for MATSIZE in 200, 500; do
	gcc -DMATSIZE=$MATSIZE mm.c -o mm
	./mm > mm_$SIZE.trace
	for DSIZE in 16k, 32k; do
		for BSIZE in 32, 64; do
			for ASSOC in 1, 2, 4; do
			./dineroIV -l1-dsize $DSIZE -l1-dbsize $BSIZE -l1-dassoc $ASSOC -l1-dccc -informat d < mm_$SIZE.trace  > stat_$SIZE_$DSIZE_$BSIZE_$ASSOC.txt
			done
		done
	done
done