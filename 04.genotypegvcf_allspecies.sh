#! /bin/bash -l
#SBATCH -A snic2017-1-499
#SBATCH -p core
#SBATCH -n 15
#SBATCH -t 48:00:00
#SBATCH -J genotypeGVCFsTremula
#SBATCH --mail-user martha.rendon@slu.se
#SBATCH --mail-type=ALL

###########################

module load bioinfo-tools
module load GATK
module load tabix


cd /proj/sllstore2017050/nobackup/tremula_asia/vcf


ref="/proj/sllstore2017050/reference/P_tremula/asp201/v2.0/hybrid_combined_reheader.fasta"

pade="/proj/sllstore2017050/nobackup/tremula_asia/pade/gatk"
palb="/proj/sllstore2017050/nobackup/tremula_asia/palb/gatk"
ptma="/proj/sllstore2017050/nobackup/tremula_asia/ptma/gatk"
pdav="/proj/sllstore2017050/nobackup/tremula_asia/pdav/gatk"
prot="/proj/sllstore2017050/nobackup/tremula_asia/prot/gatk"
pqio="/proj/sllstore2017050/nobackup/tremula_asia/pqio/gatk"
davkorea="/proj/sllstore2017059/nobackup/martha/KFRI/gatk"
davkorea2="/proj/sllstore2017059/nobackup/martha/P8915/gatk"
tremuloides="/proj/sllstore2017050/nobackup/martha/bwamapping/tremuloides/gatk"
sweden="/proj/sllstore2017050/nobackup/martha/bwamapping/tremula/gatk"
norway="/proj/sllstore2017059/nobackup/martha/P8914/gatk"
rusia="/proj/sllstore2017059/nobackup/martha/P8914/gatk"
latvia="/proj/sllstore2017059/nobackup/martha/P8914/gatk"
scottland="/proj/sllstore2017059/nobackup/martha/P8915/gatk"
iceland="/proj/sllstore2017059/nobackup/martha/Saemundur/gatk"

java -jar $GATK_HOME/GenomeAnalysisTK.jar -T GenotypeGVCFs -R $ref -nt 15 -o allsamples_raw_variants.vcf.gz \
  --variant $pade/pade_combined.g.vcf.gz \
  --variant $palb/palb_combined.g.vcf.gz \
  --variant $pdav/pdav_combined.g.vcf.gz \
  --variant $pqio/pqio_combined.g.vcf.gz \
  --variant $prot/prot_combined.g.vcf.gz \
  --variant $ptma/ptma_combined.g.vcf.gz \
  --variant $davkorea2/P8915_KOREA_combined.g.vcf.gz \
  --variant $sweden/SwAsp003_raw_variants.g.vcf.gz \
  --variant $sweden/SwAsp033_raw_variants.g.vcf.gz \
  --variant $sweden/SwAsp045_raw_variants.g.vcf.gz \
  --variant $sweden/SwAsp067_raw_variants.g.vcf.gz \
  --variant $sweden/SwAsp096_raw_variants.g.vcf.gz \
  --variant $sweden/SwAsp109_raw_variants.g.vcf.gz \
  --variant $norway/P8914_172_NORWAY_raw_variants.g.vcf.gz \
  --variant $norway/P8914_190_NORWAY_raw_variants.g.vcf.gz \
  --variant $norway/P8914_217_NORWAY_raw_variants.g.vcf.gz \
  --variant $rusia/P8914_240_RUSSIA_raw_variants.g.vcf.gz \
  --variant $rusia/P8914_249_RUSSIA_raw_variants.g.vcf.gz \
  --variant $rusia/P8914_258_RUSSIA_raw_variants.g.vcf.gz \
  --variant $latvia/P8914_263_LATVIA_raw_variants.g.vcf.gz \
  --variant $latvia/P8914_281_LATVIA_raw_variants.g.vcf.gz \
  --variant $latvia/P8914_295_LATVIA_raw_variants.g.vcf.gz \
  --variant $scottland/P8915_138_SCOTLAND_raw_variants.g.vcf.gz \
  --variant $scottland/P8915_145_SCOTLAND_raw_variants.g.vcf.gz \
  --variant $scottland/P8915_170_SCOTLAND_raw_variants.g.vcf.gz \
  --variant $iceland/Saemundur_Gardur_raw_variants.g.vcf.gz \
  --variant $iceland/Saemundur_Jorvik_raw_variants.g.vcf.gz \
  --variant $davkorea/Bonghyeon4_2_raw_variants.g.vcf.gz \
  --variant $davkorea/Daehwa18-2_raw_variants.g.vcf.gz \
  --variant $davkorea/Daehwa6-1_raw_variants.g.vcf.gz \
  --variant $davkorea/Dongdu2-1_raw_variants.g.vcf.gz \
  --variant $davkorea/Palgong1-1_raw_variants.g.vcf.gz \
  --variant $davkorea/Palgong2-3_raw_variants.g.vcf.gz \
  --variant $davkorea/Palgong3-1_raw_variants.g.vcf.gz \
  --variant $davkorea/Sogwang9-1_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb10-3_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb13-1_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb16-1_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb17-4_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb25-4_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb27-1_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb31-1_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb33-2_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb35-2_raw_variants.g.vcf.gz \
  --variant $tremuloides/Alb6-3_raw_variants.g.vcf.gz \
  --variant $tremuloides/Albb15-3_raw_variants.g.vcf.gz \
  --variant $tremuloides/Dan1-1C13_raw_variants.g.vcf.gz \
  --variant $tremuloides/Dan2-1B7_650bp_raw_variants.g.vcf.gz \
  --variant $tremuloides/PG1-1B4_raw_variants.g.vcf.gz \
  --variant $tremuloides/PG2-1B9_raw_variants.g.vcf.gz \
  --variant $tremuloides/PG3-1B6_raw_variants.g.vcf.gz \
  --variant $tremuloides/PI12-1B14_raw_variants.g.vcf.gz \
  --variant $tremuloides/PI3-1B3_raw_variants.g.vcf.gz \
  --variant $tremuloides/Sau1-1B10_raw_variants.g.vcf.gz \
  --variant $tremuloides/Sau2-1B2_raw_variants.g.vcf.gz \
  --variant $tremuloides/Sau3-1B13_raw_variants.g.vcf.gz \
  --variant $tremuloides/Wau1-1B5_raw_variants.g.vcf.gz


