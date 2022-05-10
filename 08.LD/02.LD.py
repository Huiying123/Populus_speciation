#! /usr/bin/python
#coding:utf-8

import os
import re

find_file=re.compile(r'keep2$')
for file in os.listdir('/data2/home/wangkun/04.populus/population_genomics/18.new_vcf/07.LD/list'):
            if find_file.search(file):
               print "/public/home/wangkun/software/plink/plink --bfile allspecies --r2 gz --ld-window-kb 100 --ld-window 99999 --allow-extra-chr --double-id --ld-window-r2 0 --out /data2/home/wangkun/04.populus/population_genomics/18.new_vcf/07.LD/"+file+".LD --keep /data2/home/wangkun/04.populus/population_genomics/18.new_vcf/07.LD/list/"+file,"\n"
