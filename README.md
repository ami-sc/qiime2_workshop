# qiime2 Workshop

## Environment Setup

First, create a `conda` environment to install `qiime2`:

```bash
conda env create -n qiime2 --file environment.yml
```

Download FastQC:

```bash
wget "https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip" \
    -O "./utils/fastqc.zip"
unzip "./utils/fastqc.zip" -d "./utils"
rm "./utils/fastqc.zip"
```

Download taxonomy classifier:

```bash
wget "https://data.qiime2.org/classifiers/sklearn-1.4.2/silva/silva-138-99-nb-classifier.qza" \
    -O "./utils/silva-138-99-nb-classifier.qza"
```
