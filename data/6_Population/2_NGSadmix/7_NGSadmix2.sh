#! /bin/bash

#
#SBATCH --job-name=angsd_WRT
#SBATCH --output=adNGS.txt
#SBATCH --ntasks-per-node=40
#SBATCH --nodes=1
#SBATCH --time=120:00:00
#SBATCH --mem=225G
#SBATCH -p extended-96core

#this was a first pass test, Marissa says she defined subpopulations after this using locality
#want to iterate through this, Marissa did 10 iterations /K K 1-5
#module load shared anaconda/3
#module load popgen
#module load gnu-parallel/6.0

#I=[1,2,3,4,5,6]
#K=[1,2,3,4,5,6,7,8,9,10,11,12,13,14]

#list 1
parallel --link --verbose --tmpdir ./tmp -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I1 > NGSadmix_K{1}_I1.txt" ::: $(seq 14)
#list 2
parallel --link --verbose --tmpdir ./tmp  -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I2 > NGSadmix_K{1}_I2.txt" ::: $(seq 14)
#list 3
parallel --link --verbose --tmpdir ./tmp  -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I3 > NGSadmix_K{1}_I3.txt" ::: $(seq 14)
#list 4
parallel --link --verbose --tmpdir ./tmp  -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I4 > NGSadmix_K{1}_I4.txt" ::: $(seq 14)
#list 5
parallel --link --verbose --tmpdir ./tmp  -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I5 > NGSadmix_K{1}_I5.txt" ::: $(seq 14)
#list 6
parallel --link --verbose --tmpdir ./tmp  -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I6 > NGSadmix_K{1}_I6.txt" ::: $(seq 14)
#list 7
parallel --link --verbose --tmpdir ./tmp  -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I7 > NGSadmix_K{1}_I7.txt" ::: $(seq 14)
#list 8
parallel --link --verbose --tmpdir ./tmp  -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I8 > NGSadmix_K{1}_I8.txt" ::: $(seq 14)
#list 9
parallel --link --verbose --tmpdir ./tmp  -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I9 > NGSadmix_K{1}_I9.txt" ::: $(seq 14)
#list 10
parallel --link --verbose --tmpdir ./tmp  -j 4 "NGSadmix -likes ANGSDfinalGL.beagle.gz -K {1} -minMaf 0.05 -o NGS_K{1}_I10 > NGSadmix_K{1}_I10.txt" ::: $(seq 14)
