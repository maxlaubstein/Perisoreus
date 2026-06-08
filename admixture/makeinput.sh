plink --vcf /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/vcfdata/Perisoreus_LDPruned_autosomes.vcf.gz \
    --const-fid \
    --allow-extra-chr \
    --allow-no-sex \
    --set-missing-var-ids @:#  \
    --make-bed  \
    --out Perisoreus_LDPruned_autosomes

plink --bfile Perisoreus_LDPruned_autosomes --const-fid --allow-extra-chr --allow-no-sex --recode 12 --out Perisoreus_LDPruned_autosomes
