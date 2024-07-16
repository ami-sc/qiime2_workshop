#!/bin/bash

# Import sample data into qiime.
qiime tools import \
    --type "SampleData[PairedEndSequencesWithQuality]" \
    --input-format "PairedEndFastqManifestPhred33V2" \
    --input-path "./data/manifest.tsv" \
    --output-path "./results/01_qiime_import/sample_data_demux.qza" \

# Generate summary of results to visualize sequence quality.
qiime demux summarize \
    --i-data "./results/01_qiime_import/sample_data_demux.qza" \
    --o-visualization "./results/01_qiime_import/sample_data_demux.qzv"
