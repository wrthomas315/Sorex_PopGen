#!/bin/bash

#module load hts

ls ../data/4_merge_bam/ | grep "bam" > ListBam.txt
mkdir ../data/4_merge_bam/stats/

while read j; do
	echo "Total coverage" > ../data/4_merge_bam/stats/$j"_stat.txt"
	samtools depth ../data/4_merge_bam/$j  |  awk '{sum+=$3} END { print "Average = ",sum/2405993548}' >> ../data/4_merge_bam/stats/$j"_stat.txt"
	echo "Covered depth">>   ../data/4_merge_bam/stats/$j"_stat.txt"
	samtools depth ../data/4_merge_bam/$j  |  awk '{sum+=$3} END { print "Average = ",sum/NR}' >> ../data/4_merge_bam/stats/$j"_stat.txt"
	echo "Stats" >>   ../data/4_merge_bam/stats/$j"_stat.txt"
        samtools stat ../data/4_merge_bam/$j >> ../data/4_merge_bam/stats/$j"_stat.txt"
done <ListBam.txt

rm ListBam.txt
