#!/usr/bin/perl -w

if (scalar(@ARGV) != 2){
  print "Usage: ./echon.pl <number of lines> <string>\n";
} elsif ($ARGV[0] !~ /[0-9]/ || $ARGV[0] < 0){
  print "./echon.pl: argument 1 must be a non-negative integer\n";
} else {
  for ($i = 0; $i < $ARGV[0]; $i++){
    print "$ARGV[1]\n";
  }
}
