#! /bin/bash

#
#SBATCH --job-name=angsd_WRT
#SBATCH --output=NGSad_K${1}_${2}.txt
#SBATCH --ntasks-per-node=24
#SBATCH --nodes=1
#SBATCH --time=120:00:00
#SBATCH -p extended-96core

NGSadmix -likes ANGSDfinalGL.beagle.gz -K ${1} -minMaf 0.05 -P 8 -o NGS_K${1}_I${2}
