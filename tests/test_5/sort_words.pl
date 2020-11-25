#!/usr/bin/perl -w

@lines = ();
$count = 0;
while ($line = <>){
  @line = split(/[\s]+/,$line);
  @s = sort(@line);
  $string = join(' ',@s);
  $lines[$count] = $string;
  $count += 1;
  if (eof()){
    for ($i = 0; $i < $count; $i++){
      print "$lines[$i]\n";
    }
    last;
  }
}
