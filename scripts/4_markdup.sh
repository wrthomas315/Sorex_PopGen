#!/bin/bash

#sort your bams
while read j; do
        picard SortSam I=../data/4_merge_bam/$j"_merge.bwa" O=../data/4_merge_bam/$j"_sorted.bam" SORT_ORDER=coordinate CREATE_INDEX=true
#done <../data/1_samples/ids.txt
done <../data/1_samples/ids_long_merge.txt

#then mark the duplicates within them
while read j; do
        picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/$j"_sorted.bam" O=../data/5_markdup/$j.dedup.bam METRICS_FILE=../data/5_markdup/$j.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
#done <../data/1_samples/ids.txt
done <../data/1_samples/ids_long_merge.txt
