#! /bin/bash -l
#SBATCH -A snic2017-1-499
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 10:00:00
#SBATCH --mail-user shanghuiying@outlook.com
#SBATCH --mail-type=AIL

module load bioinfo-tools
module load bwa
module load samtools
module load picard

set -e
Cores=8
##v2.0 PacBio assembly
ref="/proj/sllstore2017050/reference/P_tremula/asp201/v2.0/hybrid_combined_reheader.fasta"

##set directory
cd /proj/sllstore2017050/nobackup/tremula_asia/pade/bwa

r1=$1
r2=$2
file=${r1##*/}
RGID=${file%%_R*}
SM=${RGID}
LB="PADE"
outfile=${RGID}


echo "bwa mem -t $Cores -M $ref $r1 $r2 > $outfile.sam"
bwa mem -t $Cores -M  $ref $r1 $r2 > $outfile.sam
echo "samtools view -b -u -F 4 -q 20 -@ $Cores $outfile.sam | samtools sort -@ $Cores - > $outfile.sorted.bam"
samtools view -b -u -F 4 -q 20 -@ $Cores $outfile.sam | samtools sort -@ $Cores - > $outfile.sorted.bam
rm $outfile.sam

java -jar /sw/apps/bioinfo/picard/2.10.3/rackham/picard.jar AddOrReplaceReadGroups I=$outfile.sorted.bam O=$outfile.RGID.bam RGID=$RGID RGLB=$LB RGPL=ILLUMINA RGPU=1 RGSM=$SM CREATE_INDEX=true
rm $outfile.sorted.bam

java -jar /sw/apps/bioinfo/picard/2.10.3/rackham/picard.jar CollectAlignmentSummaryMetrics R=$ref I=$outfile.RGID.bam O=$outfile.alignment_metrics.txt

java -Xmx48g -jar /sw/apps/bioinfo/picard/2.10.3/rackham/picard.jar MarkDuplicates INPUT=$outfile.RGID.bam OUTPUT=$outfile.picard_dedup.bam METRICS_FILE=$outfile.picard_dup_metrics.txt CREATE_INDEX=true

rm $outfile.RGID.bam
rm $outfile.RGID.bai
