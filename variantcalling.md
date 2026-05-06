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
#Also in dir Perisoreus, I have the sample sheet Perisoreus_sample_sheet.csv needed for snpArcher, and the dir snpArcher created by git clone https://github.com/harvardinformatics/snpArcher.git
