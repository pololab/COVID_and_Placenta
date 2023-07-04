#!/bin/bash

for i in *.bam;
do
	sambamba sort -p -t 16 $i
	sambamba index -p -t 16 $(basename $i .bam).sorted.bam
done
