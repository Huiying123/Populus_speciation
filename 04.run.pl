#! /usr/bin/env perl
use strict;
use warnings;

my $dir=$ENV{"PWD"};
my @files=<$dir/freq_files/*/*.freq>;

my $outdir="run";
`mkdir $outdir` if(!-e "$outdir");

open O,"> $0.sh";
foreach my $file(@files){
    # print "$file\n";
    $file=~/(\w+)\/(\w+)\.freq/;
    my ($spe,$chr)=($1,$2);
    # print "$spe\t$chr\n";
    `mkdir $outdir/$spe` if(!-e "$outdir/$spe");
    `mkdir $outdir/$spe/$chr` if(!-e "$outdir/$spe/$chr");
    print O "cd $dir/$outdir/$spe/$chr; ~/software/sweepfinder/SF2/SweepFinder2 -sg 10000 $file $spe.$chr.sf2.out; cd -\n";
}
close O;

