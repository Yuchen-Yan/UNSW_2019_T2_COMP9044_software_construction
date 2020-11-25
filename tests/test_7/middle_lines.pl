#!/usr/bin/perl -w

if (-f "$ARGV[0]"){
  open F, "<", "$ARGV[0]" or die "Can't open file $ARGV[0]";
  @array = ();
  while ($line = <F>){
    push @array, $line;
  }
  close F;
  if (scalar(@array)%2 == 0){
    $n = scalar(@array)/2 - 1;
    $n_1 = $n + 1;
    print "$array[$n]";
    print "$array[$n_1]";
  } elsif(scalar(@array)%2 == 1){
    $n = (scalar(@array) - 1) / 2;
    print "$array[$n]";
  }
} else {

}
