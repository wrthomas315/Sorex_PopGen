#!/bin/bash

COUNTER=0
while read j; do
	COUNTER=$(( COUNTER + 1 ))
	S=$(awk -v VAR=$COUNTER -F'.' '{if(NR==VAR) print $1$2$3$4}' ../data/samsList.txt)
	picard SortSam I=../data/sams/$S.sam O=../data/bams/$S.bam SORT_ORDER=coordinate CREATE_INDEX=true
done <../data/samsList.txt
