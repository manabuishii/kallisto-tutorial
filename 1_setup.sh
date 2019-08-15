#!/bin/bash

wget ftp://ftp.ensembl.org/pub/release-96/fasta/mus_musculus/cdna/Mus_musculus.GRCm38.cdna.all.fa.gz
wget https://github.com/bustools/getting_started/releases/download/getting_started/10xv2_whitelist.txt
wget https://github.com/bustools/getting_started/releases/download/getting_started/transcripts_to_genes.txt
wget https://github.com/bustools/getting_started/releases/download/getting_started/SRR8599150_S1_L001_R1_001.fastq.gz
wget https://github.com/bustools/getting_started/releases/download/getting_started/SRR8599150_S1_L001_R2_001.fastq.gz

gunzip Mus_musculus.GRCm38.cdna.all.fa.gz