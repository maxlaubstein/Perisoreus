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
Also in the directory Perisoreus, I have the sample sheet 'Perisoreus_sample_sheet.csv', containing sample metadata and the paths to the read .fastq file needed for snpArcher. Additionally, I have the directory 'snpArcher' created by git clone https://github.com/harvardinformatics/snpArcher.git, with all of the needed stuff to run snpArcher.

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
From the snpArcher directory, I also copy the workflow-profiles 'snpArcher/workflow-profiles/default/config.yaml' and the config 'snpArcher/config/config.yaml' file into here into this working directory.bit redundant I guess. The workflow-profile specifies resources and stuff, whereas the general config file specifies what analyses are gonna be run, and the paths to things like the samplesheet and reference genome. I largely leave this default, except I put relevant file paths, and turn on QC analysis (set to 'true').

~~~
cp -r snpArcher/workflow-profiles/ snp_calling_Perisoreus/ #contains default/config.yaml
cp -r snpArcher/config/ snp_calling_Perisoreus/ #also contains a file called config.yaml
~~~

snakemake -s snpArcher/workflow/Snakefile --directory snp_calling_Perisoreus --workflow-profile snp_calling_Perisoreus/workflow-profiles/default --cores 1 -p all

#real run:
snakemake -s snpArcher/workflow/Snakefile -d snp_calling_Perisoreus --workflow-profile snp_calling_Perisoreus/workflow-profiles/default



