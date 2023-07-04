#!/bin/bash

. /etc/profile.d/lmod.sh

module load subread

featureCounts -a GRCh38_SARS_COV2.gtf -o counts.trim.txt -T 16 -t "gene" -g "gene_name" *dedup.bam
