#! /bin/bash

#
#SBATCH --job-name=Files_WRT
#SBATCH --output=hmmclean.txt
#SBATCH --ntasks-per-node=24
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH -p long-28core

bash 1_fastp.sh
