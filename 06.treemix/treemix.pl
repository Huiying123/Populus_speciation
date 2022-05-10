#! /usr/bin/env perl
use strict;
use warnings;

my $file="snp.filter.noN.LDpruned.treemix.frq.gz";
my $output_dir="result3";
my $root="pade";
`mkdir $output_dir` if(!-e "$output_dir");

open(O1,"> run_treemix.sh");
open(O2,"> run_plot.Rscript");
for(my $i=0;$i<11;$i++){
    my $m_para="";
    if($i>0){
        $m_para=" -m $i";
    }
    print O1 "/public/home/wangkun/software/treemix/treemix-1.13-build/bin/treemix -i $file$m_para -o $output_dir/out_$i -root $root -bootstrap -k 500 > $output_dir/out_$i.log\n";
    print O2 "source('/public/home/wangkun/software/treemix/treemix-1.13/src/plotting_funcs.R')\n";
    print O2 "pdf(file='$output_dir/out_$i.pdf')
plot_tree('$output_dir/out_$i')
plot_resid('$output_dir/out_$i','all.species')
dev.off()
";
}
close O1;
close O2;
