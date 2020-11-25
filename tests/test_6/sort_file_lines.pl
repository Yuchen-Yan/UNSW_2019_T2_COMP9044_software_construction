#!/usr/bin/perl -w

open F, "<", "$ARGV[0]" or die "Can't open file";
@array = ();
while ($line = <F>){
  push @array, $line;
}
close F;
@sorted = sort {length $a <=> length $b || $a cmp $b} @array;

foreach $item(@sorted){
  print "$item";
}
