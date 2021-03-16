#! /bin/bash -l
#SBATCH -A snic2017-1-499
#SBATCH -p core
#SBATCH -n 15
#SBATCH -t 25:00:00
#SBATCH -J genotypeGVCFsTremula
#SBATCH --mail-user martha.rendon@slu.se
#SBATCH --mail-type=ALL

###########################

module load bioinfo-tools
module load GATK
module load tabix


cd /proj/sllstore2017050/nobackup/tremula_asia/vcf


ref="/proj/sllstore2017050/reference/P_tremula/asp201/v2.0/hybrid_combined_reheader.fasta"

SWASP="/proj/sllstore2017050/nobackup/martha/GATK/GVCF"

java -jar $GATK_HOME/GenomeAnalysisTK.jar -T GenotypeGVCFs -R $ref -nt 15 -o outfile_raw_variants.vcf.gz \
  --variant $SWASP/pop10.g.vcf.gz \
  --variant $SWASP/pop11.g.vcf.gz \
  --variant $SWASP/pop12.g.vcf.gz \
  --variant $SWASP/pop1.g.vcf.gz \
  --variant $SWASP/pop2.g.vcf.gz


java -jar $GATK_HOME/GenomeAnalysisTK.jar -T SelectVariants -R $ref -V outfile_raw_variants.vcf.gz -env -selectType SNP -nt 15 -o outfile_raw_SNPs.vcf.gz

java -jar $GATK_HOME/GenomeAnalysisTK.jar -T VariantFiltration -R $ref \
        -V SwAsp_P9001_rawSNPs.vcf.gz \
        --filterExpression 'QD < 2.0' \
        --filterName "QD" \
        --filterExpression 'FS > 60.0' \
        --filterName "FS" \
        --filterExpression 'MQ < 40.0' \
        --filterName "MQ" \
        --filterExpression 'ReadPosRankSum < -8.0' \
        --filterName "ReadPosRankSum" \
        --filterExpression 'SOR > 4.0' \
        --filterName "SOR" \
        --filterExpression 'MQRankSum < -12.5' \
        --filterName "MQRankSum" \
        -o outfile_filteredSNPs.vcf.gz

