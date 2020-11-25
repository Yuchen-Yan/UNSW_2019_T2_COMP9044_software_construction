#!/usr/bin/perl -w

open F, '>' , "$ARGV[2]" or die "can't open file $ARGV[2]";
for ($s = "$ARGV[0]"; $s <= "$ARGV[1]"; $s++){
  print F "$s\n";
}
close F;
