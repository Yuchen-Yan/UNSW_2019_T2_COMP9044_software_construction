#!/usr/bin/perl -w



while ($line = <STDIN>){
  $all .= $line;
}
@a = split(/[^a-zA-Z]+/, $all);
$n = scalar(@a);
$n_n = 0;
for ($i = 0; $i < $n; $i++){
  if ($a[$i] =~ /^$ARGV[0]$/i ){
    $n_n++;
  }
}
print "$ARGV[0] occurred $n_n times\n";
