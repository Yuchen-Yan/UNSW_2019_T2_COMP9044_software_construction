#!/usr/bin/perl -w

@array = ();
while ($line = <>){
  if ($line eq eof){
    last;
  }
  push @array, $line;
}

@all = ();
foreach $item(@array){
  @l = $item =~ /[-]?[0-9]*[\.]?[0-9]+/g;
  push @all, @l;
}

if (scalar(@all) != 0){
  $max = $all[0];
  foreach $i(@all){
    if ($i =~ /[\-0-9]+/){
      if ($i > $max){
        $max = $i;
      }
    }
  }
  $flag = 1;
} else {
  $flag = 0;
}
#print "$max\n";
foreach $item(@array){
  if ($flag){
    if ($item =~ /$max/){
      print "$item";
    }
  }
}
