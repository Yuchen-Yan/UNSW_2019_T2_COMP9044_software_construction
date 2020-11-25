#!/usr/bin/perl -w
while($l = <>){
  push @lines, $l;
}
$num = scalar(@lines);
for ($i = $num; $i > 0; $i--){
  $n_l = rand($i);
  print "$lines[$n_l]";
  splice(@lines, $n_l ,1);
}
