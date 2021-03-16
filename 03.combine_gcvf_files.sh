#! /bin/bash -l
#SBATCH -A snic2017-1-499
#SBATCH -p core
#SBATCH -J combineGVCFsPALB
#SBATCH -e combineGVCFsPALB.e
#SBATCH -n 15
#SBATCH -t 12:00:00
#SBATCH --mail-user martha.rendon@slu.se
#SBATCH --mail-type=FAIL

module load bioinfo-tools
module load GATK
module load tabix

cd /proj/sllstore2017050/nobackup/tremula_asia/palb/gatk

ref="/proj/sllstore2017050/reference/P_tremula/asp201/v2.0/hybrid_combined_reheader.fasta"

### combine all
java -jar $GATK_HOME/GenomeAnalysisTK.jar -T CombineGVCFs -R $ref -o palb_combined.g.vcf.gz \
  --variant palb01_raw_variants.g.vcf.gz \
  --variant palb02_raw_variants.g.vcf.gz \
  --variant palb03_raw_variants.g.vcf.gz \
  --variant palb04_raw_variants.g.vcf.gz \
  --variant palb05_raw_variants.g.vcf.gz \
  --variant palb06_raw_variants.g.vcf.gz \
  --variant palb07_raw_variants.g.vcf.gz \
  --variant palb09_raw_variants.g.vcf.gz \
  --variant palb10_raw_variants.g.vcf.gz \
  --variant palb12_raw_variants.g.vcf.gz \
  --variant palb13_raw_variants.g.vcf.gz \
  --variant palb15_raw_variants.g.vcf.gz \
  --variant palb18_raw_variants.g.vcf.gz \
  --variant palb19_raw_variants.g.vcf.gz \
  --variant palb20_raw_variants.g.vcf.gz \
  --variant palb21_raw_variants.g.vcf.gz \
  --variant palb24_raw_variants.g.vcf.gz \
  --variant palb26_raw_variants.g.vcf.gz \
  --variant palb37_raw_variants.g.vcf.gz \
  --variant palb38_raw_variants.g.vcf.gz \
  --variant palb41_raw_variants.g.vcf.gz
