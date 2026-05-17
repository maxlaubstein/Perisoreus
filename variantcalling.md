# Canada Jay SNP Calling

## Setup

I'm working in this directory on a server (247) at Berkeley's MVZ:

/media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus

First, I download the Canada Jay reference genome from NCBI:
~~~
source ~/.bashrc
mkdir -p refgenome
cd refgenome
mamba activate ncbi_datasets
datasets download genome accession GCA_056138905.1 --include gff3,rna,cds,protein,genome,seq-report
unzip ncbi_dataset.zip
mamba deactivate
cd ../
~~~
Additionally, I have the directory 'snpArcher' created by ```git clone https://github.com/harvardinformatics/snpArcher.git``` with all of the needed stuff to run snpArcher.


I then launch a screen session:
~~~
screen -S snpcalling
~~~

In here I activate the snpArcher conda/mamba environment with snakemake and stuff:
~~~
mamba activate snparcher
~~~
To keep things from all getting tangled up, I create another directory for all the snpArcher output to go:
~~~
mkdir -p snp_calling_Perisoreus
~~~
In this directory, I put the sample sheet 'Perisoreus_sample_sheet.csv', containing sample names and the paths to the read .fastq file needed for snpArcher. Note: for the sample sheet, the format differs between snpArcher v1 and v2. Check out this link for updated info on what columns you need: https://snparcher.readthedocs.io/en/latest/v2-migration.html. In v2, its pretty much just names and read paths. 

From the snpArcher directory, I also copy the workflow-profiles and the config directories into this working directory. The workflow-profile specifies resources and stuff, whereas the general config file specifies what analyses are gonna be run, and the paths to things like the samplesheet and reference genome. I largely leave this default, except I put relevant file paths, and turn on QC analysis (set to 'true'). Also in the config directory is 'sample_metadata.csv', which has columns sample_id, exclude, outgroup, lat, and long. These are used for the QC steps, so I replace/edit it to have my sample coordinates in the same format

~~~
cp -r snpArcher/workflow-profiles/ snp_calling_Perisoreus/ #contains default/config.yaml
cp -r snpArcher/config/ snp_calling_Perisoreus/ #also contains a file called config.yaml
~~~

To clarify, the directory structure looks like:

```$ ls /media/maxlaubstein/120TB/Perisoreus```

```
refgenome
snpArcher
snp_calling_Perisoreus
```

refGenome contains the Canada Jay Reference genome, and snpArcher remains just as it was when I git cloned it. Inside snp_calling_Perisoreus I have:

```$ ls snp_calling_Perisoreus```

```
config  
Perisoreus_sample_metadata.csv
Perisoreus_sample_sheet.csv
workflow-profiles
```

config contains config.yaml and Perisoreus_sample_metadata.csv.

config/config.yaml looks something like:

~~~
# snpArcher v2 Configuration Example

samples: "/media/maxlaubstein/120TB/Perisoreus/snp_calling_Perisoreus/Perisoreus_sample_sheet.csv"

# Optional: per-sample metadata for modules (exclude, outgroup, lat, long, etc.)
sample_metadata: "/media/maxlaubstein/120TB/Perisoreus/snp_calling_Perisoreus/Perisoreus_sample_metadata.csv"

reference:
  name: "perCan"
  source: "/media/maxlaubstein/120TB/Perisoreus/refgenome/ncbi_dataset/data/GCA_056138905.1/GCA_056138905.1_P.c.canadensis_TCAG-6290_v1.0_genomic.fna"  # Can be a refseq/genbank accession, url, or path

variant_calling:
  expected_coverage: "low"  # low | high | auto (future)
  tool: "gatk" # gatk | sentieon | bcftools | deepvariant | parabricks
  ploidy: 2
  gatk:
    het_prior: 0.005
  sentieon:
    license: ""
  bcftools:
...
...
... and so on
~~~

Perisoreus_sample_metadata.csv looks like:

~~~
sample_id,lat,long
MVZ193442,51.17184,-121.57046
MVZ193443,51.15193,-121.52269
MVZ193444,51.15193,-121.52269
MVZ193445,51.15305,-121.53143
MVZ193446,51.15305,-121.53143
MVZ193449,51.14456,-121.53806
MVZ193457,49.51151,-120.71018
MVZ193458,49.50182,-120.69605
MVZ193459,49.50182,-120.69605
...
...
... and so on
~~~

## Testing

With everything set up, I try a quick test run. The following should start running if there are no problems. From /media/maxlaubstein/120TB/Perisoreus I run:

~~~
snakemake -s snpArcher/workflow/Snakefile --directory snp_calling_Perisoreus --workflow-profile snp_calling_Perisoreus/workflow-profiles/default --cores 1 -p all
~~~

...let it go for a sec, then hit control+c (^C) to cancel. 

I can also do a dry run. This prints/confirms all of the subjobs that are to be ran:

~~~
snakemake -s snpArcher/workflow/Snakefile \
  --directory snp_calling_Perisoreus \
  --workflow-profile snp_calling_Perisoreus/workflow-profiles/default \
  --dry-run
~~~

dry-run output:
~~~
Job stats:
job                             count
----------------------------  -------
fastp                             228
prepare_reference                   1
qc_generate_coords_file             1
collect_fastp_stats               227
genmap_index                        1
index_reference                     1
bwa_mem                           228
genmap_mappability                  1
picard_intervals                    1
qc_contig_map                       1
create_db_intervals                 1
mappability_bed                     1
merge_library_bams                227
concat_interval_vcfs                1
markdup_library                   227
merge_dedup_libraries             227
qc_vcftools_individuals             1
bam_stats                         227
mosdepth                          227
qc_subsample_snps                   1
callable_coverage_thresholds        1
clam_collect                        1
parse_bam_stats                   227
qc_prepare_plink_inputs             1
clam_loci                           1
combine_qc_metrics                  1
qc_plink                            1
coverage_bed                        1
qc_copy_qc_report                   1
qc_setup_admixture                  1
callable_sites_bed                  1
qc_admixture                        1
qc_qc_dashboard                     1
all                                 1
total                            2070
~~~

## Run it!

All looks good! Now, still within the screen session, in the directory /media/maxlaubstein/120TB/Perisoreus, and with the mamba env 'snparcher' still active, it's time to do the real run with the following:

~~~
snakemake -s snpArcher/workflow/Snakefile \
  --directory snp_calling_Perisoreus \
  --workflow-profile snp_calling_Perisoreus/workflow-profiles/default \
  --cores 35
~~~
