# tidyverse approach to working with vcfR data

# load packages
library("dplyr")
library("ggplot2")
library("purrr")
library("ape")

# source this script to load vcf data in tidy format
source("code/vcf_clean_script.R")

# load annotation file
gff <- ape::read.gff("data/ref_genome/ecoli_rel606.gff")

just_genes <- gff %>%
  filter(type == "gene")

combined_vcf_data %>%
  ggplot(aes(x = sample_id,
             y = QUAL)) +
  geom_boxplot()

combined_vcf_data %>%
  group_by(sample_id) %>%
  tally() %>%
  ggplot(aes(x = sample_id,
             y = n)) +
  geom_col() +
  labs(title = "Number of SNPs called per sample")

combined_vcf_data %>%
  filter(QUAL >= 200) %>%
  group_by(sample_id) %>%
  tally() %>%
  ggplot(aes(x = sample_id,
             y = n)) +
  geom_col() +
  labs(title = "Number of high quality SNPs called per sample")

