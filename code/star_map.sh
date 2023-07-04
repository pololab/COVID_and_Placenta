#!/bin/bash

REFERENCE_INDEX=GRCh38_hCOV_STAR_Ensembl
TRIMMED_READS=trimmed

. /etc/profile.d/lmod.sh
module load STAR

for i in $(echo $TRIMMED_READS/*.fastq.gz);
do

	TRIMMED_P1=$i
	STAR_MAPPING_PREFIX=$(basename $TRIMMED_P1 .fastq.gz)
	echo "$TRIMMED_P1"
	echo "$STAR_MAPPING_PREFIX"


	echo "STAR --runThreadN 16 --genomeLoad NoSharedMemory --genomeDir $REFERENCE_INDEX --readFilesIn $TRIMMED_P1 --readFilesCommand zcat --outFileNamePrefix $STAR_MAPPING_PREFIX --outSAMtype BAM Unsorted --outSAMattributes All --alignIntronMax 1000000 --alignEndsType Local"
	
	STAR --runThreadN 16 --genomeLoad NoSharedMemory --genomeDir $REFERENCE_INDEX --readFilesIn $TRIMMED_P1 --readFilesCommand zcat --outFileNamePrefix $STAR_MAPPING_PREFIX --outSAMtype BAM Unsorted --outSAMattributes All --alignIntronMax 1000000 --alignEndsType Local

done
