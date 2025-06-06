#! /bin/bash

#pops=14
#iters-5

for i in {1..14}; do
	for j in {1..5}; do
		sed "s/#SBATCH --output=NGSad_K\${1}_\${2}.txt/#SBATCH --output=NGSad_K$i$j_I$j.txt/" 7_NGSadmix.sh > script.sh
		sbatch script.sh $i $j
	done
done
