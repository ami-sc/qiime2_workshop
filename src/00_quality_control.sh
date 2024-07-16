#!/bin/bash

# Create directory for FastQC reports.
mkdir -p "results/00_quality_control/fastqc"

# Generate sample quality reports with FastQC.
for file in ./data/*/*
do
    ./utils/FastQC/fastqc "${file}" \
        --outdir "./results/00_quality_control/fastqc"
done

# Generate aggregated report with MultiQC.
multiqc \
    --outdir "./results/00_quality_control" \
    --filename "QC_Report.html" \
    "./results/00_quality_control/fastqc"
