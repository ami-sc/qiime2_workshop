#!/bin/bash

# De-noise data using qiime's dada2 pipeline.
# --p-min-overlap: We want a minimum overlap of 4 for merging forward and reverse reads.
# --p-chimera-method: Remove chimeras as detected in samples individually.
# --p-min-fold-parent-over-abundance: Minimum abundance of potential parents of a sequence being tested as chimeric.
# --p-trunc-q: Reads are truncated if there is at least one instance with a quality score of 4 or less.
# --p-trunc-len-f & --p-trunc-len-r: Truncate reads to 200 bp.

qiime dada2 denoise-paired \
    --p-n-threads 10 \
    --i-demultiplexed-seqs "./results/02_trimming/sample_data_demux_trimmed.qza" \
    --p-chimera-method "consensus" \
    --p-trunc-len-f 200 \
    --p-trunc-len-r 200 \
    --p-trunc-q 4 \
    --p-min-overlap 15 \
    --p-min-fold-parent-over-abundance 4 \
    --o-table "./results/03_denoise_merge/sample_data_demux_trimmed_ft_table.qza" \
    --o-representative-sequences "./results/03_denoise_merge/sample_data_demux_trimmed_rep_seq.qza" \
    --o-denoising-stats "./results/03_denoise_merge/sample_data_demux_trimmed_dada2_stats.qza"

# Generate visualization based on de-noising statistics.
qiime metadata tabulate \
    --m-input-file "./results/03_denoise_merge/sample_data_demux_trimmed_dada2_stats.qza" \
    --o-visualization "./results/03_denoise_merge/sample_data_demux_trimmed_dada2_stats.qzv"
