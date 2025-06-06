#!/bin/bash

#for help understanding read groups, look here https://gatk.broadinstitute.org/hc/en-us/articles/360035890671-Read-groups

#bwa index -p mSorAra2 mSorAra2.pri.cur.20220707.fasta

#low coverage
#COUNTER=0
#while read j; do
#	COUNTER=$(( COUNTER + 1 ))
#	S=$(awk -v VAR=$COUNTER -F'.' '{if(NR==VAR) print $1}' ../data/1_samples/merged_fastqs2.txt | awk -F'_' '{print $1}')
#	L=$(awk -v VAR=$COUNTER -F'.' '{if(NR==VAR) print $1}' ../data/1_samples/merged_fastqs2.txt | awk -F'_' '{print $2}' | sed 's/L//g')
#	echo $L
#	echo $COUNTER
#	echo $S'_'L$L'_1.trimmed.fastq'
#	if [[ $L -gt 4 ]]
#	then
#		bwa mem -M -t 1 -R '@RG\tID:2.$L\tPU:V350090598.$L.$S\tSM:$S\tPL:DNBseq\tLB:seqWell96' mSorAra2 ../data/2_trimmed/$S'_'L$L'_1.trimmed.fastq' ../data/2_trimmed/$S'_'L$L'_2.trimmed.fastq' > $S'_'L$L".bwa.sam"
#	else
#		bwa mem -M -t 1 -R '@RG\tID:1.$L\tPU:V350090584.$L.$S\tSM:$S\tPL:DNBseq\tLB:seqWell96' mSorAra2 ../data/2_trimmed/$S'_'L$L'_1.trimmed.fastq' ../data/2_trimmed/$S'_'L$L'_2.trimmed.fastq' > $S'_'L$L".bwa.sam"
#	fi
#done <../data/1_samples/merged_fastqs2.txt


#high coverage
###
#1
bwa mem -M -t 1 -R '@RG\tID:E150016228.1\tPU:E150016228.1.HC1\tSM:HC1\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E150016228_L01_28_1.trimmed.fastq ../data/2_trimmed/E150016228_L01_28_2.trimmed.fastq > E150016228_L01_28.bwa.sam
#2
#bwa mem -M -t 1 -R '@RG\tID:E150016228.1\tPU:E150016228.1.HC2\tSM:HC2\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E150016228_L01_29_1.trimmed.fastq ../data/2_trimmed/E150016228_L01_29_2.trimmed.fastq > E150016228_L01_29.bwa.sam
#3
#bwa mem -M -t 1 -R '@RG\tID:E150016228.1\tPU:E150016228.1.HC3\tSM:HC3\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E150016228_L01_30_1.trimmed.fastq ../data/2_trimmed/E150016228_L01_30_2.trimmed.fastq > E150016228_L01_30.bwa.sam
#4
#bwa mem -M -t 1 -R '@RG\tID:E150016228.1\tPU:E150016228.1.HC4\tSM:HC4\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E150016228_L01_114_1.trimmed.fastq ../data/2_trimmed/E150016228_L01_114_2.trimmed.fastq > E150016228_L01_114.bwa.sam
#5
#bwa mem -M -t 1 -R '@RG\tID:E150016228.1\tPU:E150016228.1.HC5\tSM:HC5\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E150016228_L01_32_1.trimmed.fastq ../data/2_trimmed/E150016228_L01_32_2.trimmed.fastq > E150016228_L01_32.bwa.sam
#6
#bwa mem -M -t 1 -R '@RG\tID:E100071867.1\tPU:E100071867.1.HC6\tSM:HC6\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E100071867_L01_45_1.trimmed.fastq ../data/2_trimmed/E100071867_L01_45_2.trimmed.fastq > E100071867_L01_45.bwa.sam
#6.2
#bwa mem -M -t 1 -R '@RG\tID:E150011538.1\tPU:E150011538.1.HC6\tSM:HC6\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E150011538_L01_45_1.trimmed.fastq ../data/2_trimmed/E150011538_L01_45_2.trimmed.fastq > E150011538_L01_45.bwa.sam
#7
#bwa mem -M -t 1 -R '@RG\tID:E100071867.1\tPU:E100071867.1.HC7\tSM:HC7\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E100071867_L01_46_1.trimmed.fastq ../data/2_trimmed/E100071867_L01_46_2.trimmed.fastq > E100071867_L01_46.bwa.sam
#8.1
#bwa mem -M -t 1 -R '@RG\tID:E100071867.1\tPU:E100071867.1.HC8\tSM:HC8\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E100071867_L01_47_1.trimmed.fastq ../data/2_trimmed/E100071867_L01_47_2.trimmed.fastq > E100071867_L01_47.bwa.sam
#8.2
#bwa mem -M -t 1 -R '@RG\tID:E150011538.1\tPU:E150011538.1.HC8\tSM:HC8\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E150011538_L01_47_1.trimmed.fastq ../data/2_trimmed/E150011538_L01_47_2.trimmed.fastq > E150011538_L01_47.bwa.sam
#9
#bwa mem -M -t 1 -R '@RG\tID:E150016228.1\tPU:E150016228.1.HC9\tSM:HC9\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E150016228_L01_33_1.trimmed.fastq ../data/2_trimmed/E150016228_L01_33_2.trimmed.fastq > E150016228_L01_33.bwa.sam
#10
#bwa mem -M -t 1 -R '@RG\tID:E150016228.1\tPU:E150016228.1.HC10\tSM:HC10\tPL:DNBseq\tLB:Short_Insert_Lib' mSorAra2 ../data/2_trimmed/E150016228_L01_34_1.trimmed.fastq ../data/2_trimmed/E150016228_L01_34_2.trimmed.fastq > E150016228_L01_34.bwa.sam
