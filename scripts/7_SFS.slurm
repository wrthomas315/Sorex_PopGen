#Marisa method
#Need the site frequency spectrum for two populations
#UK
#angsd -bam /pylon5/bi4iflp/mlim/SeqCapData/angsd_analysis/Fst_dxy_theta/ccorubams_pop1.list -ref /pylon5/bi4iflp/mlim/SeqCapData/species_ref_files/Ccoruscans_reffasta/ref_ccoru_targetedRegionAndFlanking.fasta -anc /pylon5/bi4iflp/mlim/SeqCapData/species_ref_files/Ccoruscans_reffasta/ref_ccoru_targetedRegionAndFlanking.fasta -only_proper_pairs 0 -minMapQ 10 -minQ 20 -GL 1 -doSaf 1 -sites /pylon5/bi4iflp/mlim/SeqCapData/Novoalign_outs/ccoru.keep -rf /pylon5/bi4iflp/mlim/SeqCapData/Novoalign_outs/ccoru.rf -out /pylon5/bi4iflp/mlim/SeqCapData/angsd_analysis/Fst_dxy_theta/Fst/ccoru_forFstpop1_out -minInd 6 -minIndDepth 3 -doCounts 1
angsd -bam UK_list.txt -ref ../../../scripts/mSorAra2.pri.cur.20220707.fasta -anc ../../../scripts/mSorAra2.pri.cur.20220707.fasta -gl 2 -domajorminor 2 -dosaf 1 -SNP_pval 1e-6 -minMapQ 30 -minQ 20 -minInd 23 -minMaf 0.05 -doGlf 2 -docounts 1 -out ANGSDfinal.UKpop
#Continental
angsd -bam Cont_list.txt -ref ../../../scripts/mSorAra2.pri.cur.20220707.fasta -anc ../../../scripts/mSorAra2.pri.cur.20220707.fasta -gl 2 -domajorminor 2 -dosaf 1 -SNP_pval 1e-6 -minMapQ 30 -minQ 20 -minInd 23 -minMaf 0.05 -doGlf 2 -docounts 1 -out ANGSDfinal.Contpop
#
realSFS ANGSDfinal.UKpop.saf.idx ANGSDfinal.Contpop.saf.idx > pop12.ml
realSFS fst index ANGSDfinal.UKpop.saf.idx ANGSDfinal.Contpop.saf.idx -sfs pop12.ml -fstout pop12_fstout
realSFS fst stats pop12_fstout.fst.idx > pop12_fstout.txt

###lcws

