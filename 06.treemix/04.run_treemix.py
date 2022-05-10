#! /usr/bin/python
# utf-8

for n in range(0,11):
    print "/public/home/wangkun/software/treemix/treemix-1.13-build/bin/treemix -i snp.filter.noN.LDpruned.treemix.frq.gz -m",str(n), "-o snp.filter.noN.LDpruned.treemix.frq.gz."+str(n), "-bootstrap -k 500 > treemix."+str(n)+"log"  
