## Pull ND2 from Perisoreus WGS VCF

~~~
cd /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/mtdna

#get the mitogenome fasta:
samtools faidx /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/snp_calling_Perisoreus/results/reference/perCan.fa.gz CM148749.1 > mitogenome.fa

#get raw vcf just from the mitochondrial scaffold
bcftools view \
  -r CM148749.1 \
  -Oz -o Perisoreus_mtdna_RAW.vcf.gz \
  /media/maxlaubstein/22ea017e-93fd-4567-876e-3b9a92534a89/maxlaubstein/Perisoreus/snp_calling_Perisoreus/results/vcfs/raw.vcf.gz

blastn -query 1_Alberta_G366_ND2.fasta  -subject mitogenome.fa
~~~

~~~
#blastn -query 1_Alberta_G366_ND2.fasta  -subject mitogenome.fa

BLASTN 2.17.0+


Reference: Zheng Zhang, Scott Schwartz, Lukas Wagner, and Webb
Miller (2000), "A greedy algorithm for aligning DNA sequences", J
Comput Biol 2000; 7(1-2):203-14.



Database: User specified sequence set (Input: mitogenome.fa).
           1 sequences; 16,919 total letters



Query= Contig10

Length=1041
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

CM148749.1                                                            1901    0.0  


> CM148749.1
Length=16919

 Score = 1901 bits (1029),  Expect = 0.0
 Identities = 1037/1041 (99%), Gaps = 0/1041 (0%)
 Strand=Plus/Plus

Query  1     ATGAATCCCCAAGCGAAACTAATCTTTGTCATTAGCCTACTCCTAGGAACAACCATCACA  60
             ||||||||||||||||||||||||||||||| ||||||||||||||||||||||||||||
Sbjct  4008  ATGAATCCCCAAGCGAAACTAATCTTTGTCACTAGCCTACTCCTAGGAACAACCATCACA  4067

Query  61    ATCTCAAGCAACCATTGAGTTATAGCCTGAACCGGTCTTGAAATCAACACACTCGCCATT  120
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4068  ATCTCAAGCAACCATTGAGTTATAGCCTGAACCGGTCTTGAAATCAACACACTCGCCATT  4127

Query  121   CTACCCTTAATCTCAAAGTCCCATCATCCCCGAGCTATTGAAGCAGCAACCAAATACTTC  180
             |||||| |||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4128  CTACCCCTAATCTCAAAGTCCCATCATCCCCGAGCTATTGAAGCAGCAACCAAATACTTC  4187

Query  181   CTAGTACAAGCAGCCGCCTCAACTCTAGTGCTATTCTCCAGCATAACCAATGCATGATCC  240
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4188  CTAGTACAAGCAGCCGCCTCAACTCTAGTGCTATTCTCCAGCATAACCAATGCATGATCC  4247

Query  241   ACTGGACAATGGGATATTACTCAACTAACCCACCCAACATCTTCCCTAATTCTAACTGCA  300
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4248  ACTGGACAATGGGATATTACTCAACTAACCCACCCAACATCTTCCCTAATTCTAACTGCA  4307

Query  301   GCCATTTCGATAAAACTAGGACTTGCACCATTCCACTTTTGATTCCCAGAAGTTTTACAA  360
             |||||||||||||||||||||||||| |||||||||||||||||||||||||||||||||
Sbjct  4308  GCCATTTCGATAAAACTAGGACTTGCGCCATTCCACTTTTGATTCCCAGAAGTTTTACAA  4367

Query  361   GGCTCTCCTCTAACCACAGGTCTCCTTCTGTCGACAGTCATAAAATTCCCACCTATCACT  420
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4368  GGCTCTCCTCTAACCACAGGTCTCCTTCTGTCGACAGTCATAAAATTCCCACCTATCACT  4427

Query  421   CTACTCTTTATGACTTCTCAGTCACTCAACCCCACGCTACTAACCACTATGGCTATTCTT  480
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4428  CTACTCTTTATGACTTCTCAGTCACTCAACCCCACGCTACTAACCACTATGGCTATTCTT  4487

Query  481   TCCGTAGCCCTTGGAGGATGAATGGGACTAAACCAAACACAAACCCGAAAAATCATGGCC  540
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4488  TCCGTAGCCCTTGGAGGATGAATGGGACTAAACCAAACACAAACCCGAAAAATCATGGCC  4547

Query  541   TTCTCCTCTATCTCTCATCTAGGTTGAATAGCAATTATTCTAGTATACTACCCTAAACTT  600
             ||||||||||||||||||||||||||||||||||| ||||||||||||||||||||||||
Sbjct  4548  TTCTCCTCTATCTCTCATCTAGGTTGAATAGCAATCATTCTAGTATACTACCCTAAACTT  4607

Query  601   ACCCTACTTAACTTTTACATGTACAGTGTAATAACCGCTGCCGTATTCCTAACCCTAAAC  660
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4608  ACCCTACTTAACTTTTACATGTACAGTGTAATAACCGCTGCCGTATTCCTAACCCTAAAC  4667

Query  661   TCAACAAAAACTCTAAAACTATCAACGCTAATAACCGCATGAACAAAAGCACCTTCACTC  720
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4668  TCAACAAAAACTCTAAAACTATCAACGCTAATAACCGCATGAACAAAAGCACCTTCACTC  4727

Query  721   AACACTATTCTCCTACTAACACTTCTATCTCTAGCCGGCCTCCCTCCTCTGACTGGTTTC  780
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4728  AACACTATTCTCCTACTAACACTTCTATCTCTAGCCGGCCTCCCTCCTCTGACTGGTTTC  4787

Query  781   CTGCCAAAATGACTCATCATTCAAGAACTAACTAAACAGGACATAGCCCCAGCAGCAATA  840
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4788  CTGCCAAAATGACTCATCATTCAAGAACTAACTAAACAGGACATAGCCCCAGCAGCAATA  4847

Query  841   ATCCTTTCACTCCTATCACTACTAGGGCTCTTCTTCTACCTTCGTCTTGCATATTGCGCA  900
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4848  ATCCTTTCACTCCTATCACTACTAGGGCTCTTCTTCTACCTTCGTCTTGCATATTGCGCA  4907

Query  901   ACAATCACACTTCCACCACACACTACAAATCACATAAAACAATGACACGTCAACAAACCG  960
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4908  ACAATCACACTTCCACCACACACTACAAATCACATAAAACAATGACACGTCAACAAACCG  4967

Query  961   GTTAATACCTCCATCGCCGTTCTGACTACACTCTCTATCATGCTCCTCCCAATTTCCCCC  1020
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  4968  GTTAATACCTCCATCGCCGTTCTGACTACACTCTCTATCATGCTCCTCCCAATTTCCCCC  5027

Query  1021  ATACTATCCAACATCATTTAA  1041
             |||||||||||||||||||||
Sbjct  5028  ATACTATCCAACATCATTTAA  5048



Lambda      K        H
    1.33    0.621     1.12 

Gapped
Lambda      K        H
    1.28    0.460    0.850 

Effective search space used: 17325575


  Database: User specified sequence set (Input: mitogenome.fa).
    Posted date:  Unknown
  Number of letters in database: 16,919
  Number of sequences in database:  1



Matrix: blastn matrix 1 -2
Gap Penalties: Existence: 0, Extension: 2.5

~~~

~~~
tabix -p vcf Perisoreus_mtdna_RAW.vcf.gz
bcftools view -r CM148749.1:4008-5048 Perisoreus_mtdna_RAW.vcf.gz -Oz -o ND2.vcf.gz
samtools faidx mitogenome.fa CM148749.1:4008-5048 > ND2_ref.fa
tabix -p vcf ND2.vcf.gz
~~~

Get full ND2 fasta for each individual in the vcf:
~~~
mkdir -p output_ND2_fastas
for sample in $(bcftools query -l ND2.vcf.gz); do
  bcftools consensus -f ND2_ref.fa -s "$sample" ND2.vcf.gz > output_ND2_fastas/${sample}_ND2.fa
done

~~~
