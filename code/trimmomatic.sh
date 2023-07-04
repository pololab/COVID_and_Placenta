#!/bin/bash

. /etc/profile.d/lmod.sh
module load trimmomatic

RAW_READS=raw
ILLUMINA_FASTA=illumina_primers.fa

for i in $(echo $RAW_READS/*.fastq.gz);
do

	P1=$i
	TRIMMED_P1=$(basename $P1 _R1.fastq.gz).fastq.gz
	TRIMMOMATIC_LOG=$(basename $P1 .fastq.gz | sed 's/_R1//g')_trimmomatic.log

	echo $P1
	echo $TRIMMED_P1
	echo $TRIMMOMATIC_LOG

	echo "trimmomatic SE -threads 16 -phred33 $P1 $TRIMMED_P1 CROP:101 MINLEN:10 2> $TRIMMOMATIC_LOG"
	trimmomatic SE -threads 16 -phred33 $P1 $TRIMMED_P1 CROP:101 MINLEN:10 2> $TRIMMOMATIC_LOG

done
