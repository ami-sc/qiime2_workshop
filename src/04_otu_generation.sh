#!/bin/bash

# Assign taxonomy by using a pre-trained Naive-Bayes classifier specific for 16S V4 regions.
qiime feature-classifier classify-sklearn \
    --p-n-jobs 10 \
    --i-classifier "./utils/silva-138-99-nb-classifier.qza" \
    --i-reads "./results/03_denoise_merge/sample_data_demux_trimmed_rep_seq.qza" \
    --o-classification "./results/04_otu_generation/taxonomy_silva.qza"

# Visualize taxonomy.
qiime metadata tabulate \
    --m-input-file "./results/04_otu_generation/taxonomy_silva.qza" \
    --o-visualization "./results/04_otu_generation/taxonomy_silva.qzv"
