#!/bin/bash

while read j; do
        echo $j
        fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L1_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L1_2.fq.gz" -m --merged_out "../data/2_trimmed/"$j"_L1.merged.trimmed.fastq" --out1 "../data/2_trimmed/"$j"_L1_1.trimmed.fastq" --out2 "../data/2_trimmed/"$j"_L1_2.trimmed.fastq" --html $j"L1.html" --json $j"L1.json" 2> $j"L1.log"
	fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L2_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L2_2.fq.gz" -m --merged_out "../data/2_trimmed/"$j"_L2.merged.trimmed.fastq" --out1 "../data/2_trimmed/"$j"_L2_1.trimmed.fastq" --out2 "../data/2_trimmed/"$j"_L2_2.trimmed.fastq" --html $j"L2.html" --json $j"L2.json" 2> $j"L2.log"
	fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L3_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L3_2.fq.gz" -m --merged_out "../data/2_trimmed/"$j"_L3.merged.trimmed.fastq" --out1 "../data/2_trimmed/"$j"_L3_1.trimmed.fastq" --out2 "../data/2_trimmed/"$j"_L3_2.trimmed.fastq" --html $j"L3.html" --json $j"L3.json" 2> $j"L3.log"
	fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L4_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L4_2.fq.gz" -m --merged_out "../data/2_trimmed/"$j"_L4.merged.trimmed.fastq" --out1 "../data/2_trimmed/"$j"_L4_1.trimmed.fastq" --out2 "../data/2_trimmed/"$j"_L4_2.trimmed.fastq" --html $j"L4.html" --json $j"L4.json" 2> $j"L4.log"
	fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L5_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L5_2.fq.gz" -m --merged_out "../data/2_trimmed/"$j"_L5.merged.trimmed.fastq" --out1 "../data/2_trimmed/"$j"_L5_1.trimmed.fastq" --out2 "../data/2_trimmed/"$j"_L5_2.trimmed.fastq" --html $j"L5.html" --json $j"L5.json" 2> $j"L5.log"
done <../data/1_samples/ids.txt

while read j; do
        echo $j
        fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/long_reads/complete/"$j"1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/long_reads/complete/"$j"2.fq.gz" -m --merged_out "../data/2_trimmed/"$j"merged.trimmed.fastq" --out1 "../data/2_trimmed/"$j"1.trimmed.fastq" --out2 "../data/2_trimmed/"$j"2.trimmed.fastq" --html $j".html" --json $j".json" 2> $j".log"
done <../data/1_samples/ids_hicov.txt
