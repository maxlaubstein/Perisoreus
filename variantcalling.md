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
