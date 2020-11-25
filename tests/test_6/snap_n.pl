#!/usr/bin/perl -w

@array = ();
while ($line = <STDIN>){
  push @array, $line;
  $c = 0;
  foreach $item(@array){
    if ($item eq $line){
      $c++;
    }
  }
  if ($c == $ARGV[0]){
    print "Snap: $line";
    last;
  }
}
