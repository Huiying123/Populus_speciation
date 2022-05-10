/public/home/wangkun/software/vcftools/vcftools_0.1.13/bin/vcftools --gzvcf ../SNPs_filtered.lowdepth.missing.dup.recode.vcf.gz --max-missing 1 --recode --stdout |gzip > snp.filter.noN.vcf.gz
