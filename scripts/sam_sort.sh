#!/bin/bash

COUNTER=0
while read j; do
	COUNTER=$(( COUNTER + 1 ))
	S=$(awk -v VAR=$COUNTER -F'.' '{if(NR==VAR) print $1 FS $2}' ../data/samsListhicov.txt)
	echo $S
	#picard SortSam I=../data/sams_hicov/$S.sam O=../data/sams_hicov/$S.bam SORT_ORDER=coordinate CREATE_INDEX=true
done <../data/samsListhicov.txt
