#!/bin/bash

#
#picard SortSam I=../data/4_merge_bam/E100071867_L01_46.bwa.sam O=../data/4_merge_bam/E100071867_L01_46_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
#picard SortSam I=../data/4_merge_bam/E150011538_L01_45_merge.bwa O=../data/4_merge_bam/E150011538_L01_45_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
#picard SortSam I=../data/4_merge_bam/E150011538_L01_47_merge.bwa O=../data/4_merge_bam/E150011538_L01_47_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
#picard SortSam I=../data/4_merge_bam/E150016228_L01_114.bwa.sam O=../data/4_merge_bam/E150016228_L01_114_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
#picard SortSam I=../data/4_merge_bam/E150016228_L01_28.bwa.sam O=../data/4_merge_bam/E150016228_L01_28_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
#picard SortSam I=../data/4_merge_bam/E150016228_L01_29.bwa.sam O=../data/4_merge_bam/E150016228_L01_29_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
#picard SortSam I=../data/4_merge_bam/E150016228_L01_30.bwa.sam O=../data/4_merge_bam/E150016228_L01_30_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
#picard SortSam I=../data/4_merge_bam/E150016228_L01_32.bwa.sam O=../data/4_merge_bam/E150016228_L01_32_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
picard SortSam I=../data/4_merge_bam/E150016228_L01_33.bwa.sam O=../data/4_merge_bam/E150016228_L01_33_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
picard SortSam I=../data/4_merge_bam/E150016228_L01_34.bwa.sam O=../data/4_merge_bam/E150016228_L01_34_sorted.bam SORT_ORDER=coordinate CREATE_INDEX=true
#
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E100071867_L01_46_sorted.bam O=../data/5_markdup/E100071867_L01_46.dedup.bam METRICS_FILE=../data/5_markdup/E100071867_L01_46.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E150011538_L01_45_sorted.bam O=../data/5_markdup/E150011538_L01_45.dedup.bam METRICS_FILE=../data/5_markdup/E150011538_L01_45.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E150011538_L01_47_sorted.bam O=../data/5_markdup/E150011538_L01_47.dedup.bam METRICS_FILE=../data/5_markdup/E150011538_L01_47.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E150016228_L01_114_sorted.bam O=../data/5_markdup/E150016228_L01_114.dedup.bam METRICS_FILE=../data/5_markdup/E150016228_L01_114.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E150016228_L01_28_sorted.bam O=../data/5_markdup/E150016228_L01_28.dedup.bam METRICS_FILE=../data/5_markdup/E150016228_L01_28.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E150016228_L01_29_sorted.bam O=../data/5_markdup/E150016228_L01_29.dedup.bam METRICS_FILE=../data/5_markdup/E150016228_L01_29.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E150016228_L01_30_sorted.bam O=../data/5_markdup/E150016228_L01_30.dedup.bam METRICS_FILE=../data/5_markdup/E150016228_L01_30.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E150016228_L01_32_sorted.bam O=../data/5_markdup/E150016228_L01_32.dedup.bam METRICS_FILE=../data/5_markdup/E150016228_L01_32.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E150016228_L01_33_sorted.bam O=../data/5_markdup/E150016228_L01_33.dedup.bam METRICS_FILE=../data/5_markdup/E150016228_L01_33.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
picard MarkDuplicates TMP_DIR=tmp I=../data/4_merge_bam/E150016228_L01_34_sorted.bam O=../data/5_markdup/E150016228_L01_34.dedup.bam METRICS_FILE=../data/5_markdup/E150016228_L01_34.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
