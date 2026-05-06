# Canada Jay SNP Calling

I'm working in this directory on a server at Berkeley's MVZ:

/media/maxlaubstein/120TB/Perisoreus

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

```ls /media/maxlaubstein/120TB/Perisoreus```

```refgenome  snpArcher  snp_calling_Perisoreus```

refGenome contains the Canada Jay Reference genome, and snpArcher remains just as it was when I git cloned it. Inside snp_calling_Perisoreus I have:

```ls snp_calling_Perisoreus```

```config  Perisoreus_sample_metadata.csv  Perisoreus_sample_sheet.csv  workflow-profiles```


$ ls snp_calling_Perisoreus
[1;34mconfig[0m
Perisoreus_sample_metadata.csv
Perisoreus_sample_sheet.csv
[1;34mworkflow-profiles[0m


snakemake -s snpArcher/workflow/Snakefile --directory snp_calling_Perisoreus --workflow-profile snp_calling_Perisoreus/workflow-profiles/default --cores 1 -p all

#real run:
snakemake -s snpArcher/workflow/Snakefile -d snp_calling_Perisoreus --workflow-profile snp_calling_Perisoreus/workflow-profiles/default



