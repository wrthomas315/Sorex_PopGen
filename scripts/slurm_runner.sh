#! /bin/bash

#
#SBATCH --job-name=angsd_WRT
#SBATCH --output=pcangstd.txt
#SBATCH --ntasks-per-node=40
#SBATCH --nodes=1
#SBATCH --time=48:00:00
#SBATCH -p long-96core

bash 5_h_angsd.sh
