#! /bin/bash -l
#SBATCH -A snic2017-1-499
#SBATCH -p core
#SBATCH -n 15
#SBATCH -t 15:00:00
#SBATCH --mail-user martha.rendon@slu.se
#SBATCH --mail-type=ALL

###########################
## run HaplotypeCaller GATK

module load bioinfo-tools
module load GATK
module load tabix


cd /proj/sllstore2017050/nobackup/tremula_asia/pade/gatk


ref="/proj/sllstore2017050/reference/P_tremula/asp201/v2.0/hybrid_combined_reheader.fasta"

MAPDIR="/proj/sllstore2017050/nobackup/tremula_asia/pade/bwa"
file=$1
ID=${file%%.*}

java -jar $GATK_HOME/GenomeAnalysisTK.jar -T RealignerTargetCreator -R $ref -I $MAPDIR/$file -o ${ID}_realignment_targets.list

java -jar $GATK_HOME/GenomeAnalysisTK.jar -T IndelRealigner -R $ref -I $MAPDIR/$file -targetIntervals ${ID}_realignment_targets.list -o ${ID}_realigned_reads.bam

java -jar $GATK_HOME/GenomeAnalysisTK.jar -T HaplotypeCaller -R $ref -I ${ID}_realigned_reads.bam -ERC GVCF -nct 15 -o ${ID}_raw_variants.g.vcf

rm ${ID}_realigned_reads.bam
rm ${ID}_realigned_reads.bai

bgzip ${ID}_raw_variants.g.vcf
tabix -p vcf ${ID}_raw_variants.g.vcf.gz
