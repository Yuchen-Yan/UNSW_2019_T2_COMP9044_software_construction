#!/usr/bin/perl

$size = @ARGV;
if ($size == 0){
  print "Usage: ./identical_files.pl <files>\n";
  exit();
}
@files = ();
foreach $file(@ARGV){
  $string = '';
  open F, '<', "$file" or die "Can't open files";
  while ($line = <F>){
    $string .= $line;
  }
  close F;
  push @files, $string;
}

$dif = 0;
for ($i = 0; $i < $size-1; $i++){
  if ($files[$i] eq $files[$i+1]){

  } else {
    $dif = 1;
    last;
  }
}

if ($dif){
  print "$ARGV[$i+1] is not identical\n";
} else {
  print "All files are identical\n";
}
