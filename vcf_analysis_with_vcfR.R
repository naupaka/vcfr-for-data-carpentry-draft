# Some example code for analyzing VCF data in R with vcfR package

# load packages
library("vcfR")
library("ape")

# load in files
genome <- ape::read.dna("data/ref_genome/ecoli_rel606.fasta", format = "fasta")
gff <- ape::read.gff("data/ref_genome/ecoli_rel606.gff")
vcf <- vcfR::read.vcfR("data/vcf/SRR2584866_final_variants.vcf")

# create default vcfR object
chrom <- create.chromR(name = 'ecoli', vcf = vcf, seq = genome, ann = gff)

# example plot 1
plot(chrom)

# example plot 2
chromoqc(chrom, dp.alpha = 20)

# process chrom object for more detailed analysis
chrom <- proc.chromR(chrom, verbose = TRUE)

# plot 3
plot(chrom)

# plot 4
chromoqc(chrom, dp.alpha = 20)
