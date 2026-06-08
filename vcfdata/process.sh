cd /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/vcfdata

#Process the raw vcf file to include only biallelic SNPs with a minor allele frequency of 0.01 and no missing sites
vcftools --gzvcf /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/snp_calling_Perisoreus/results/vcfs/raw.vcf.gz \
  --bed /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/snp_calling_Perisoreus/results/callable_sites/callable_sites.bed \
  --min-alleles 2 \
  --max-alleles 2 \
  --max-missing 1.0 \
  --maf 0.01 \
  --remove-indels \
  --recode \
  --recode-INFO-all \
  --out Perisoreus_clean

mv Perisoreus_clean.recode.vcf Perisoreus_clean.vcf
bgzip Perisoreus_clean.vcf
tabix -p vcf Perisoreus_clean.vcf.gz
