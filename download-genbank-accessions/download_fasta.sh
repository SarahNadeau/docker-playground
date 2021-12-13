#!/bin/bash

for ASSEMBLY_ID in $(cat /data/accession_list.txt) ; do
  echo "Downloading $ASSEMBLY_ID.fasta"
  # This command taken from: https://github.com/WGS-standards-and-analysis/datasets/blob/master/scripts/GenFSGopher.pl
  esearch -db assembly -query "$ASSEMBLY_ID NOT refseq[filter]" | elink -target nuccore -name assembly_nuccore_insdc | efetch -format fasta > /data/"$ASSEMBLY_ID".fasta
done
