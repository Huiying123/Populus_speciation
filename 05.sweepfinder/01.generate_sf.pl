#! /usr/bin/env perl
use strict;
use warnings;

my $vcf="new.vcf.gz";
my $pop_list="pop.list";

###########
# first_col  second_col
# pop_name   ind_name
# pop_name   ind_name
# pop_name   ind_name
###########

my $outdir="freq_files";
`mkdir $outdir` if(!-e $outdir);

my %dict;
my %pop;
open I,"< $pop_list";
while (<I>) {
    chomp;
    my @a=split(/\s+/);
    my ($pop,$ind)=@a;
    $dict{$ind}=$pop;
    $pop{$pop}{$ind}=0;
}
close I;

open I,"zcat $vcf |";
my @head;
while (<I>) {
    chomp;
    my @a=split(/\s+/);
    next if(/^##/);
    if(/^#/){
        @head=split(/\s+/);
        last;
    }
}

my %count;
my %filehandle;
for(my $i=9;$i<@head;$i++){
    my $ind=$head[$i];
    if(!exists $dict{$ind}){
        next;
    }
    my $pop=$dict{$ind};
    $count{$pop}++;
}

while (<I>) {
    chomp;
    my @a=split(/\s+/);
    my $chr=$a[0];
    my $pos=$a[1];
    next unless($chr=~/chr/);
    my %result;
    for(my $i=9;$i<@a;$i++){
        my $ind=$head[$i];
        if(!exists $dict{$ind}){
            next;
        }
        my $pop=$dict{$ind};
        if($a[$i]=~/0\/0/){
            $result{$pop}{ref}+=2;
            $result{$pop}{alt}+=0
        }
        elsif ($a[$i]=~/0\/1/) {
            $result{$pop}{ref}+=1;
            $result{$pop}{alt}+=1;
        }
        elsif ($a[$i]=~/1\/1/) {
            $result{$pop}{ref}+=0;
            $result{$pop}{alt}+=2;
        }
    }
    foreach my $pop(sort keys %result){
        my $num=$result{$pop}{ref}+$result{$pop}{alt};
        my $left=$result{$pop}{ref};
        if($result{$pop}{ref}>$result{$pop}{alt}){
            $left=$result{$pop}{alt};
        }
        my $line="$pos\t$left\t$num\t1\n";
        if(!exists $filehandle{$pop}{$chr}){
            `mkdir $outdir/$pop/` if(!-e "$outdir/$pop/");
            open $filehandle{$pop}{$chr},"> $outdir/$pop/$chr.freq";
            $filehandle{$pop}{$chr}->print("position\tx\tn\tfolded\n");
        }
        $filehandle{$pop}{$chr}->print("$line");
    }
}

close I;

foreach my $pop(keys %filehandle){
    foreach my $chr(keys %{$filehandle{$pop}}){
        close $filehandle{$pop}{$chr};
    }
}
