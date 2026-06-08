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

#Now, get a vcf just of the placed autosomal scaffolds
#49 is mtdna, 47 W, 48 Z

awk '{print $1}' \
  /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/snp_calling_Perisoreus/results/reference/perCan.fa.gz.fai \
  | grep CM \
  | grep -v CM148749.1 \
  | grep -v CM148747.1 \
  | grep -v CM148748.1 \
  | paste -sd, - 

#CM148719.1,CM148720.1,CM148721.1,CM148722.1,CM148723.1,CM148724.1,CM148725.1,CM148726.1,CM148727.1,CM148728.1,CM148729.1,CM148730.1,CM148731.1,CM148732.1,CM148733.1,CM148734.1,CM148735.1,CM148736.1,CM148737.1,CM148738.1,CM148739.1,CM148740.1,CM148741.1,CM148742.1,CM148743.1,CM148744.1,CM148745.1,CM148746.1

bcftools view -r CM148719.1,CM148720.1,CM148721.1,CM148722.1,CM148723.1,CM148724.1,CM148725.1,CM148726.1,CM148727.1,CM148728.1,CM148729.1,CM148730.1,CM148731.1,CM148732.1,CM148733.1,CM148734.1,CM148735.1,CM148736.1,CM148737.1,CM148738.1,CM148739.1,CM148740.1,CM148741.1,CM148742.1,CM148743.1,CM148744.1,CM148745.1,CM148746.1 \
  Perisoreus_clean.vcf.gz \
  -O z -o Perisoreus_clean_autosomes.vcf.gz

#LD pruning: 
plink --vcf Perisoreus_clean_autosomes.vcf.gz \
  --const-fid \
  --allow-extra-chr \
  --allow-no-sex \
  --set-missing-var-ids @:# \
  --indep-pairwise 50 10 0.1 \
  --out Perisoreus_LDPruned_autosomes

plink --vcf Perisoreus_clean_autosomes.vcf.gz \
  --const-fid \
  --allow-extra-chr \
  --allow-no-sex \
  --set-missing-var-ids @:#  \
  --extract Perisoreus_LDPruned_autosomes.prune.in \
  --recode vcf \
  --out Perisoreus_LDPruned_autosomes

  #plink messes up the sample names in the vcf with "0_":
  bcftools reheader \
    -s <(bcftools query -l Perisoreus_LDPruned_autosomes.vcf | sed 's/^0_//') \
    Perisoreus_LDPruned_autosomes.vcf \
    -o Perisoreus_LDPruned_autosomes_fixed.vcf

rm Perisoreus_LDPruned_autosomes.vcf
mv Perisoreus_LDPruned_autosomes_fixed.vcf Perisoreus_LDPruned_autosomes.vcf
bgzip Perisoreus_LDPruned_autosomes.vcf
tabix -p vcf Perisoreus_LDPruned_autosomes.vcf.gz


