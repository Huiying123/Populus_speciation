/home/uni/programme/plink/plink --vcf ../Populus_all.filtered.lowdepth.missing.recode.vcf --make-bed --allow-extra-chr --double-id --o
02.vcfobed.sh 

/home/uni/programme/king/king -b populus.all.bed --kinship --prefix populus.all.snp

/home/uni/programme/king/king -b populus.all.bed --duplicate --prefix populus.duplicate
