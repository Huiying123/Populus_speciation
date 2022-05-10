#! /usr/bin/python
# coding:utf-8

for i in range(1,20):
    print "/home/uni/programme/samtools/samtools-1.3.1/bcftools/bcftools-1.3.1/bcftools view -O z /media/uni/data/projects/population_data/18.new_vcf/snp.filtered.lowdepth.missing.biallele.maf0.1.LD.vcf.gz chr"+str(i), "> /media/uni/data/projects/population_data/18.new_vcf/06.fd/01.vcf/populus_chr"+str(i)+".vcf.gz"
