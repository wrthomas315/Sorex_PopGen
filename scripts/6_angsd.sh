#!/bin/bash


#angsd -bam angsd_Fillpoint2.txt -GL 2 -doMajorMinor 1 -doMaf 1 -SNP_pval 2e-6 -minMapQ 30 -minQ 20 -minInd 25 -minMaf 0.05 -doGlf 2 -out slurmfillpoint2 -P 24
pcangsd -b slurmfillpoint2.beagle.gz -e 2 -t 64 -o fillpoint2.output.pcangsd -post_save

