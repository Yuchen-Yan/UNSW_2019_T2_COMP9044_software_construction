#!/usr/bin/perl -w

open F, '<', "$ARGV[0]" or die "Can't open the file";
@lines = ();
while ($line=<F>){
  push @lines, $line;
}
close F;

@output = ();
foreach $line(@lines){
  $line =~ s/[0-9]/#/g;
  push @output, $line;
}
open F, '>', "$ARGV[0]" or die "Can't open the file";
foreach $l(@output){
  print F "$l";
}
close F;
