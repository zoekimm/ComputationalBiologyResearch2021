# Identifying and Annotating Variants in GRCh38 and CHM13

[Genome Analysis Toolkit](https://gatk.broadinstitute.org/hc/en-us), a platform developed by the Broad Institute, has been used as a standard to discover genetic variants in computational biology. However, Google has recently developed a variant caller [DeepVariant](https://google.github.io/deepvariant/)  that treats variant discovery as an image classification task using deep learning techniques.

Human genome reference is significant in identifying and examining any potential variants in genes. Up to date, [GRCh38](https://www.ncbi.nlm.nih.gov/assembly/GCF_000001405.26/) has been the standard human genome reference in computational biomedical research. However, approximately 8% of the human genome remained unknown until Telomere-to-Telomere (T2T) announced [CHM13](https://www.ncbi.nlm.nih.gov/assembly/GCA_009914755.3/), a new human reference genome that filled in these prevailing, unknown gaps. [[Paper]](https://www.biorxiv.org/content/10.1101/2021.07.12.452063v1.full) 

Since CHM13 is a reference genome that has been recently established and therefore has not been analyzed yet, the goal of this research was to identify genetic variants in the GRCh38 and CHM13 with both variant callers, the Genome Analysis Toolkit (GATK) and DeepVariant, respectively.

This repository contains scripts and results from exome alignment, variant discovery, and VCF annotation. 

### Library/Package Used 

Alignment
* [Bowtie2](https://github.com/BenLangmead/bowtie2)

Variant Discovery
* [Genome Analysis Toolkit](https://gatk.broadinstitute.org/hc/en-us)
* [DeepVariant](https://google.github.io/deepvariant/)  

Variant Analysis
* [bcftools](http://samtools.github.io/bcftools/bcftools.html)
* [SnpEff](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3679285/)
* [SnpSift](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3679285/)




