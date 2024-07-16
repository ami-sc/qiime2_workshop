#!/bin/bash

# Forward Primer (Present in 5' End of Read 1)
# Reverse Primer (Present in 5' End of Read 2)

# Trim 5' end primers.
qiime cutadapt trim-paired \
    --p-cores 10 \
    --p-front-f GTGCCAGCMGCCGCGGTAA \
    --p-front-r GGACTACHVGGGTWTCTAAT \
    --i-demultiplexed-sequences "./results/01_qiime_import/sample_data_demux.qza" \
    --o-trimmed-sequences "./results/02_trimming/sample_data_demux_trimmed.qza" \
    --p-minimum-length 100 \
    --verbose

# Generate summary of results.
qiime demux summarize \
    --i-data "./results/02_trimming/sample_data_demux_trimmed.qza" \
    --o-visualization "./results/02_trimming/sample_data_demux_trimmed.qzv"
