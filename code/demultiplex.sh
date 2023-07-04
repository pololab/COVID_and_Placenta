#!/bin/bash

. /etc/profile.d/lmod.sh                                                                                                                                                    
module load trimmomatic

P1=$1
TRIMMED_P1=$(basename $P1 .fastq.gz).trim.fastq.gz
TRIMMOMATIC_LOG=$(basename $P1 .fastq.gz)_trimmomatic.log

trimmomatic SE -threads 16 -phred33 $P1 $TRIMMED_P1 CROP:18 MINLEN:18 2> $TRIMMOMATIC_LOG

sabre sabre pe -c -u -m 1 -l 10 -n -s stats_1.txt -f 21-0816-39_S1_L001_R1_001.trim.fastq.gz -r 21-0816-39_S1_L001_R2_001.fastq.gz -b barcodes.txt
