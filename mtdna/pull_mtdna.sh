cd /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/mtdna

#get the mitogenome fasta:
samtools faidx /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/snp_calling_Perisoreus/results/reference/perCan.fa.gz CM148749.1 > mitogenome.fa

#get raw vcf just from the mitochondrial scaffold
vcftools --gzvcf /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/snp_calling_Perisoreus/results/vcfs/raw.vcf.gz \
  --chr CM148749.1
  --recode \
  --recode-INFO-all \
  --out Perisoreus_mtdna_RAW
