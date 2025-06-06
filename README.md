###Shrew Population Genetics
###Started 7/26/2023
###William Thomas

#Have two data sets. 96 samples from across Europe with low coverage. These can be used to determine population structuring, and isolation by distance/environment. Additionally, we have 10 high coverage samples that can be used for population demography (PSMC/SMC++).



#First, load some of the modules we will need on Seawulf.
#load conda on SeaWulf
module load anaconda/
#and diff express to get fastp for sequencing QC
module load diffexp/1.0



#Get genome from NCBI
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/027/595/985/GCF_027595985.1_mSorAra2.pri/GCF_027595985.1_mSorAra2.pri_rna.fna.gz ~/Sorex_PopGen/data/0_reference/
mv ~/Sorex_PopGen/data/0_reference/GCF_027595985.1_mSorAra2.pri_genomic.fna.gz ~/Sorex_PopGen/data/0_reference/mSorAra2.pri.cur.20220707.fasta.gz



#Now run fastp over all the transcripts to trim adapters and prune phred <15. This step is done for both data sets.
module load slurm
sbatch slurm_fastp.sh
#which runs
bash fastp.sh
#whose code loops through an id list and runs fastp on each fastq file. Below shows this process for the 96 low coverage samples, that were sequenced across 5 lanes.
#######
#!/bin/bash
while read j; do
        echo $j
        fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L1_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L1_2.fq.gz" -m --merged_out "../data/trimmed/"$j"_L1.merged.trimmed.fastq" --out1 "../data/trimmed/"$j"_L1_1.trimmed.fastq" --out2 "../data/trimmed/"$j"_L1_2.trimmed.fastq" --html $j"L1.html" --json $j"L1.json" 2> $j"L1.log"
        fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L2_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L2_2.fq.gz" -m --merged_out "../data/trimmed/"$j"_L2.merged.trimmed.fastq" --out1 "../data/trimmed/"$j"_L2_1.trimmed.fastq" --out2 "../data/trimmed/"$j"_L2_2.trimmed.fastq" --html $j"L2.html" --json $j"L2.json" 2> $j"L2.log"
        fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L3_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L3_2.fq.gz" -m --merged_out "../data/trimmed/"$j"_L3.merged.trimmed.fastq" --out1 "../data/trimmed/"$j"_L3_1.trimmed.fastq" --out2 "../data/trimmed/"$j"_L3_2.trimmed.fastq" --html $j"L3.html" --json $j"L3.json" 2> $j"L3.log"
        fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L4_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L4_2.fq.gz" -m --merged_out "../data/trimmed/"$j"_L4.merged.trimmed.fastq" --out1 "../data/trimmed/"$j"_L4_1.trimmed.fastq" --out2 "../data/trimmed/"$j"_L4_2.trimmed.fastq" --html $j"L4.html" --json $j"L4.json" 2> $j"L4.log"
        fastp --in1 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L5_1.fq.gz" --in2 "/gpfs/scratch/withomas/project_shrewPopGen/data/seq/F23A480000379_SORdyxfR_20Jun2023/"$j"/"$j"_L5_2.fq.gz" -m --merged_out "../data/trimmed/"$j"_L5.merged.trimmed.fastq" --out1 "../data/trimmed/"$j"_L5_1.trimmed.fastq" --out2 "../data/trimmed/"$j"_L5_2.trimmed.fastq" --html $j"L5.html" --json $j"L5.json" 2> $j"L5.log"
done <../data/ids.txt
#######



#Create a list of the merged fastq (merging forward and reverse)
ls ../data/trimmed/ | grep "merged" > ../merged_fastqs.txt




#Now align these merged files with our new chromosome level genome assembly using BWA.
#1 load hts module on Seawulf
module load hts/1.0
#2 index genome
bwa index -p mSorAra2 /gpfs/scratch/withomas/project_shrew_genome/data/genomes/sorAra/mSorAra2.pri.cur.20220707.fasta 
#3 map to genome
sbatch slurm_bwa.sh
#which runs
bash bwa.sh
#######
#!/bin/bash
COUNTER=0
while read j; do
        COUNTER=$(( COUNTER + 1 ))
        S=$(awk -v VAR=$COUNTER -F'.' '{if(NR==VAR) print $1}' ../data/merged_fastqs.txt | awk -F'_' '{print $1}')
        L=$(awk -v VAR=$COUNTER -F'.' '{if(NR==VAR) print $1}' ../data/merged_fastqs.txt | awk -F'_' '{print $2}' | sed 's/L//g')
        if [[ $L -gt 4 ]]
        then
                bwa mem -M -t 1 -R '@RG\tID:2.$L\tPU:V350090598.$L.$S\tSM:$S\tPL:DNBseq\tLB:seqWell96' mSorAra2 ../data/trimmed/$j > $j"_bwa.sam"
        else
                bwa mem -M -t 1 -R '@RG\tID:1.$L\tPU:V350090584.$L.$S\tSM:$S\tPL:DNBseq\tLB:seqWell96' mSorAra2 ../data/trimmed/$j > $j"_bwa.sam"
        fi
done <../data/merged_fastqs.txt
#######



#Now sort the sam files into bam files
#make a list of same files
ls sams/ > samsList.txt
bash sam_sort.sh
#######
#!/bin/bash
COUNTER=0
while read j; do
        COUNTER=$(( COUNTER + 1 ))
        S=$(awk -v VAR=$COUNTER -F'.' '{if(NR==VAR) print $1$2$3$4}' ../data/samsList.txt)
        picard SortSam I=../data/sams/$S.sam O=../data/bams/$S.bam SORT_ORDER=coordinate CREATE_INDEX=true
done <../data/samsList.txt
#######
#unsure maybe should be using 3_merge_sam.sh or 3.1_merge_sam.sh for merging instead of the earlier merge? 





#For low coverage samples
#Now mark the duplicate read alignments and merge samples from separate lanes
bash mark_duplicates.sh
#which runs
while read j; do
        picard MarkDuplicates TMP_DIR=tmp I=$j"_L1.merged.trimmed.fastq_bwa.bam" I=$j"_L2.merged.trimmed.fastq_bwa.bam" I=$j"_L3.merged.trimmed.fastq_bwa.bam" I=$j"_L4.merged.trimmed.fastq_bwa.bam" I=$j"_L5.merged.trimmed.fastq_bwa.bam"  O=$j.dedup.bam METRICS_FILE=$j.dedup.metrics.txt REMOVE_DUPLICATES=false TAGGING_POLICY=All
done <bamsListpruned2.txt
#Low coverage
###Set up PCANGSD
module load git
git clone https://github.com/Rosemeis/pcangsd.git
cd pcangsd/
conda env create -f environment.yml
pip3 install --user -r requirements.txt
python setup.py build_ext --inplace
#below did not work because of write permissions
pip3 install -e .

#Now run PCANGSD (can be done local)
#pcangsd -b tester.beagle.gz -e 2 -t 64 -o test.output.pcangsd
angsd -bam angsdListFiltpoint2.txt -GL 2 -doMajorMinor 1 -doMaf 1 -SNP_pval 2e-6 -minMapQ 30 -minQ 20 -minInd 25 -minMaf 0.05 -doGlf 2 -out slurmfillpoint2 -P 24
pcangsd -b slurmfillpoint2.beagle.gz -e 2 -t 64 -o fillpoint2.output.pcangsd


#Get stats on coverage, etc.
bash 5_stats.sh
#Run ANGSD
bash 6_angsd.sh
#Get SFS
sbatch 7_SFS.slurm

#Not done: Isolation by distance and isolation by environment (Mantel test/partial Mantel test). Unsure if above was done correctly? Also look at test statistics?



#Below works but does not give a result that feels correct
#For high coverage samples
#Generate VCFs
#Make alternate dictionaries with samtools to make vcf
samtools faidx /gpfs/scratch/withomas/project_shrew_genome/data/genomes/sorAra/mSorAra2.pri.cur.20220707.fasta
samtools dict /gpfs/scratch/withomas/project_shrew_genome/data/genomes/sorAra/mSorAra2.pri.cur.20220707.fasta > mSorAra2.dict
#Create genomic database with GATK, for either each individual or each chromosome
#Chromosome
bash genomics-db-array_scaff.sh 
#which runs
#!/bin/bash
gatk --java-options "-Xmx4g" GenomicsDBImport \
      --batch-size 50 --reader-threads 2 --genomicsdb-shared-posixfs-optimizations \
      $(awk 'NR>1 {printf(" -V %s.g.vcf.gz ", $1);}' bam_ids.txt) \
      $(awk 'NR>1 {printf(" -L %s ", $2);}' numbered-mSorAra2-scaffolds_auto.tsv) \
      --merge-contigs-into-num-partitions 1 \
      --genomicsdb-workspace-path ./genomics_db2/scaff_auto > ./gatklogdir/stdout_sex.txt  2> ./gatklogdir/stderr_sex.txt
#Individual
bash genomics-db-array.sh 
#which runs
#!/bin/bash
cat numbered-mSorAra2-chromosomes.tsv | grep "SUPER" | awk '{print $2}' > mSorAra.chromlist
while read j; do
gatk --java-options "-Xmx4g" GenomicsDBImport \
      --batch-size 50 --reader-threads 2 --genomicsdb-shared-posixfs-optimizations \
      $(awk 'NR>1 {printf(" -V %s.g.vcf.gz ", $1);}' bam_ids.txt) \
      -L $j \
      --genomicsdb-workspace-path ./genomics_db2/$j > ./gatklogdir/stdout.txt  2> ./gatklogdir/stderr.txt
done <mSorAra.chromlist
#Turn the databases into vcfs
bash gdb2vcf-sg-array.sh
#which runs
#!/bin/bash
while read j; do
        gatk --java-options "-Xmx4g" GenotypeGVCFs \
        -R ./mSorAra2.fasta \
        -V gendb://genomics_db2/$j \
        -O vcfs2/$j.vcf.gz > vcf_longs2/stdout.$j 2> vcf_longs2/stderr.$j 
done <mSorAra.chromscafflist
#Call haplotypes
bash gvcf.sh
#which runs
#!/bin/bash
while read j; do
        gatk --java-options "-Xmx4g" HaplotypeCaller -R mSorAra2.fasta -I $j".dedup.bam" -O $j".g.vcf.gz" -ERC GVCF
done <bam_ids.txt
#Merge these vcfs so single VCF for all individuals called HiCovall.vcf.gz, just in case needed
bash concatenate_vcfs.sh
#which runs
#!/bin/bash
bcftools concat -O z ./vcfs/*.vcf.gz > ./final/HiCovall.vcf.gz
#Finally, run script to get complementary masking to remove long stretches of homozygozity which may bias demographic models
#For example:
bedtools complement -i SUPER_1.vcf.gz -g comp.chrom.tsv -L >> SUPER_1_comp.bed
bgzip SUPER_1_comp.bed
tabix -p bed SUPER_1_comp.bed.gz



#SMC++
#set working directory for singularity bin
export SINGULARITY_BINDPATH="/gpfs/scratch/withomas/project_shrewPopGen/data/sams_hicov/vcfs2:/gpfs/home/withomas"
#Run smc based on populations found from ANGSD PCA output, run for each chromosome seperate and then together
singularity run ../../../bin/smpcc.sif vcf2smc SUPER_1.vcf.gz SUPER_1/mask/pop1/SUPER_1.pop1out.smc.gz SUPER_1 pop1:HC1,HC10 -m SUPER_1.bed.gz
singularity run ../../../bin/smpcc.sif vcf2smc SUPER_1.vcf.gz SUPER_1/mask/pop2/SUPER_1.pop2out.smc.gz SUPER_1 pop2:HC2,HC3,HC4,HC5,HC6,HC7,HC8,HC9 -m SUPER_1.bed.gz
singularity run smpcc.sif estimate 3.887e-8 SUPER_1.smc.pop1out.gz
singularity run smpcc.sif estimate 3.887e-8 SUPER_1.smc.pop2out.gz
#have also ran above with all chromosomes, and tried different mutations rates (1.8e-9)
singularity run ../../../bin/smpcc.sif cv -o pop1 2.2e-9 ./SUPER_1/mask/pop1/SUPER_1.pop1out.smc.gz ./SUPER_2/mask/pop1/SUPER_2.pop1out.smc.gz ./SUPER_3/mask/pop1/SUPER_3.pop1out.smc.gz ./SUPER_4/mask/pop1/SUPER_4.pop1out.smc.gz ./SUPER_5/mask/pop1/SUPER_5.pop1out.smc.gz ./SUPER_6/mask/pop1/SUPER_6.pop1out.smc.gz ./SUPER_7/mask/pop1/SUPER_7.pop1out.smc.gz ./SUPER_8/mask/pop1/SUPER_8.pop1out.smc.gz ./SUPER_9/mask/pop1/SUPER_9.pop1out.smc.gz ./SUPER_10/mask/pop1/SUPER_10.pop1out.smc.gz ./SUPER_11/mask/pop1/SUPER_11.pop1out.smc.gz ./SUPER_X/mask/pop1/SUPER_X.pop1out.smc.gz --timepoints 1000 50000
# attempt with full population with split
singularity run smpcc.sif vcf2smc SUPER_5.vcf.gz SUPER_5.smc.pop12out.gz SUPER_5 pop1:HC1,HC10 pop2:HC2,HC3,HC4,HC5,HC6,HC7,HC8,HC9 -c 200000
singularity run smpcc.sif vcf2smc SUPER_5.vcf.gz SUPER_5.smc.pop21out.gz SUPER_5 pop2:HC2,HC3,HC4,HC5,HC6,HC7,HC8,HC9 pop1:HC1,HC10 -c 200000
singularity run smpcc.sif split pop1.model.final.json pop2model.final.json SUPER_5.smc.pop1out.gz SUPER_5.smc.pop2out.gz SUPER_5.smc.pop12out.gz SUPER_5.smc.pop21out.gz



#PSMC
#Note, made VCFs in different manner
module load psmc
bash bcf.script.slurm
#which runs
#!/bin/bash
#Create genotype likelihoods | call variants
bcftools mpileup -Ou -f ../mSorAra2.fasta ../HiCov2.dedup.bam | bcftools call -mv -Oz --threads 10 -o HiCov2.output.vcf.gz
#Index the VCF
bcftools index HiCov2.output.vcf.gz
#Generate consensus file
bcftools consensus -f ../mSorAra2.fasta HiCov2.output.vcf.gz > consensus.HiCov2.fa
#Run PSMC
psmc -N25 -t15 -r5 -p "4+25*2+4+6" consensus.HiCov2.fa -o HiCov2.psmc
#Plot PSMCS result
psmc -N25 -t15 -r5 consensus.HiCov2.fa -o HiCov2.psmc
