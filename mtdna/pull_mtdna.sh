cd /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/mtdna

#get the mitogenome fasta:
samtools faidx /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/snp_calling_Perisoreus/results/reference/perCan.fa.gz CM148749.1 > mitogenome.fa

#get raw vcf just from the mitochondrial scaffold
bcftools view \
  -r CM148749.1 \
  -Oz -o Perisoreus_mtdna_RAW.vcf.gz \
  /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/snp_calling_Perisoreus/results/vcfs/raw.vcf.gz
