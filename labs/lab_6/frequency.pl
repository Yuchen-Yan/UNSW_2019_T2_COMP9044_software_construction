#!/usr/bin/perl -w
@files = <lyrics/*>;

foreach $file(@files){
  open F, "<", "$file" or die "Can't open this file";
  $all = "";
  while ($line = <F>){
    $all .= $line;
  }
  @a = split(/[^a-zA-Z]+/,$all);
  $n_file = scalar(@a) - 1;

  $n_n = 0;
  for ($i = 0; $i < $n_file; $i++){
    if ($a[$i] =~ /^$ARGV[0]$/i ){
      $n_n++;
    }
  }

  $file =~ s/.txt//;
  $file =~ s/(lyrics\/)//;
  $file =~ s/(\_)/ /g;
  $fre = $n_n/ $n_file;
  if (length($n_n) < 3){
    for ($i = 0;$i < 3 - length($n_n); $i++){
      print " ";
    }
  }
  $fre = sprintf("%.9f", $fre);
  print "$n_n/ $n_file = $fre $file\n"

}
