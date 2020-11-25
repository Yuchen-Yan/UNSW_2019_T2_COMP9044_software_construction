#!/usr/bin/perl -w



while ($line = <>){
  $all .= $line;
}
@a = split(/[^a-zA-Z]+/, $all);
$n = scalar(@a);

$n = $n - 1;


print "$n words\n";
