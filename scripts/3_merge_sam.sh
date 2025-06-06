#!/bin/bash

#module load hts

#merge then sort
while read j; do
	#echo $j
	samtools merge ../data/3_bwa/$j"_L1.bwa.sam" ../data/3_bwa/$j"_L2.bwa.sam" ../data/3_bwa/$j"_L3.bwa.sam" ../data/3_bwa/$j"_L4.bwa.sam" ../data/3_bwa/$j"_L5.bwa.sam"  -o ../data/4_merge_bam/$j"_merge.bwa" -O BAM
        #samtools sort -@ 8 ../data/5_merge_sam/$j"_merge.bwa" -o ../data/5_merge_sam/$j"_merge.bwa.sam"
done <../data/1_samples/ids.txt
