#! /usr/bin/env bash

#problem 1: the largest overlap between CTCF and H3K4me3 locations

#define working dataset route
datasets=$HOME/devel/data-sets
tfbs_bed=$HOME/devel/data-sets/bed/encode.tfbs.chr22.bed.gz
histone_bed=$HOME/devel/data-sets/bed/encode.h3k4me3.hela.chr22.bed.gz

#extract all CTCF to the peak file
gzcat $tfbs_bed | awk '$4 == "CTCF"' > ctcf-peak.bed

answer1=$(bedtools intersect -a ctcf-peak.bed -b $histone_bed -wo \
    | awk '{print $NF}' | sort -nr | head -n1)

echo "answer-1: $answer1 " > answers.yml

#problem 2: calculate GC content of 19,000,000 to 19,000,500 on chr22
echo -e "chr22\t19000000\t19000500" > chr22.bed
fasta=$HOME/devel/data-sets/fasta/hg19.chr22.fa

answer2=$(bedtools nuc -fi $fasta -bed chr22.bed \
 | grep -v '#' | awk '{print $5}')

echo "answer-2: $answer2" >> answers.yml

#problem 3: length of the ctcf chip-seq peak
#already defined ctcf-peak.bed which includes all the CTCF peaks
bedgraph=$HOME/devel/data-sets/bedtools/ctcf.hela.chr22.bg.gz

answer3=$(bedtools map -a ctcf-peak.bed -b $bedgraph -c 4 -o mean \
 | sort -k5nr | awk '{print $3 - $2}' | head -n1)

echo "answer-3: $answer3" >> answers.yml

#question 4

#define dataset route
tss_bed=$HOME/devel/data-sets/bed/tss.hg19.chr22.bed.gz
genome=$HOME/devel/data-sets/genome/hg19.genome

#creat a bed file contains promoter
bedtools flank -i $tss_bed -g $genome -s -l 1000 -r 0 > promoter.bed
answer4=$(bedtools sort -i promoter.bed \
 | bedtools map -a stdin -b $bedgraph -c 4 -o mean | sort -k7nr \
 | awk '{print $4}' | head -n1)

echo "answer-4: $answer4" >>answers.yml

#question 5
gene=$HOME/devel/data-sets/bed/genes.hg19.bed.gz

answer5=$(bedtools complement -i $gene  -g $genome \
 | awk '$1 ==  "chr22" {print $1, $2, $3, $3 - $2}' | sort -k4nr | head -n1 \
 | awk 'BEGIN {OFS = ""} {print $1,":",$2,"-",$3}')



echo "answer-5: $answer5" >> answers.yml

