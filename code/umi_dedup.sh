#!/bin/bash

# Added safety. If any command fails or a pipe breaks, the script will stop running.                                                                                                                                                       

set -eu -o pipefail -o verbose

BAM=$1

je markdupes INPUT=$BAM OUTPUT=$(basename $BAM .sorted.bam)_dedup.bam MM=0 METRICS_FILE=$(basename $BAM .sorted.bam).metrics REMOVE_DUPLICATES=true ASSUME_SORTED=true > $(basename $BAM .sorted.bam).dedup.log 2>&1
