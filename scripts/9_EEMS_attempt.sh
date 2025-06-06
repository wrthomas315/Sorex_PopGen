#! /bin/bash

#
#SBATCH --job-name=EEMS
#SBATCH --output=EEMS_slurm.txt
#SBATCH --ntasks-per-node=1
#SBATCH --nodes=1
#SBATCH --time=168:00:00
#SBATCH -p extended-96core

#sites 10333164
/gpfs/scratch/withomas/bin/ngsDist/ngsDist --geno ANGSDfinalEEMS.geno.gz --n_ind 92 --n_sites 10333165 --out EEMSout
