#! /bin/bash

#
#SBATCH --job-name=Files_WRT
#SBATCH --output=hmmclean_32.txt
#SBATCH --ntasks-per-node=40
#SBATCH --nodes=1
#SBATCH --time=20:00:00
#SBATCH -p long-40core

#short reads and first hicoverage
bash 2_bwa.sh
#hicoverage / split these to have run individuals
bash 2_bwa_1.sh
bash 2_bwa_2.sh
bash 2_bwa_3.sh
bash 2_bwa_4.sh
bash 2_bwa_5.sh
bash 2_bwa_6.sh
bash 2_bwa_6_2.sh
bash 2_bwa_7.sh
bash 2_bwa_8.sh
bash 2_bwa_8_2.sh
bash 2_bwa_9.sh
bash 2_bwa_10.sh
