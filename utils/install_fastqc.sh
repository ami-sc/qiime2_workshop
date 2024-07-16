#!/bin/bash

wget "https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip" \
    -O "./utils/fastqc.zip"
unzip "./utils/fastqc.zip" -d "./utils"
rm "./utils/fastqc.zip"
