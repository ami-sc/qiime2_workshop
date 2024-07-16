#!/bin/bash

# Remove any non-bacterial taxa.
qiime taxa filter-table \
    --i-table "./results/03_denoise_merge/sample_data_demux_trimmed_ft_table.qza" \
    --i-taxonomy "./results/04_otu_generation/taxonomy_silva.qza" \
    --p-exclude "archaea,chloroplast,mitochondria,eukaryota" \
    --o-filtered-table "./results/05_filtering/ft_table_filtered.qza"

# Summarize the filtered samples data table
qiime feature-table summarize \
    --i-table "./results/05_filtering/ft_table_filtered.qza" \
    --o-visualization "./results/05_filtering/ft_table_filtered.qzv" \
