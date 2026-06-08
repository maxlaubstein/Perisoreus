plink --vcf /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/vcfdata/Perisoreus_LDPruned_autosomes.vcf.gz \
  --const-fid \
  --allow-extra-chr \
  --allow-no-sex \
  --set-missing-var-ids @:#  \
  --pca  \
  --out Perisoreus_PCA
