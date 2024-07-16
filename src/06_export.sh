#!/bin/bash

# Export the filtered feature table.
qiime tools export \
    --input-path "./results/05_filtering/ft_table_filtered.qza" \
    --output-path "./results/06_export"

# Convert the .biom file (feature table) to a .tsv file.
biom convert \
    --input-fp "./results/06_export/feature-table.biom" \
    --output-fp "./results/06_export/feature-table.tsv" \
    --to-tsv

# Export taxonomy information.
qiime tools export \
    --input-path "./results/04_otu_generation/taxonomy_silva.qza" \
    --output-path "./results/06_export"
