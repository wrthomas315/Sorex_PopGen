#!/bin/bash

while read j; do
	picard SamSort I=samplename_bwa.sam O=samplename_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
done <../data/merged_fastqs.txt
