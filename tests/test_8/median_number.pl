#!/usr/bin/perl -w

@sorted = sort { $a <=> $b }(@ARGV);
$n = (scalar(@ARGV) - 1) / 2;

print "$sorted[$n]\n";
