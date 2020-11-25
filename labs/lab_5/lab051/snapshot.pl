#!/usr/bin/perl -w
use File::Copy;

if ($ARGV[0] eq "save"){
  @file = glob(".snapshot.*");
  $n = @file;
  mkdir ".snapshot.$n";

  @files = glob("*");
  foreach $file(@file){
    if ($file ne "snapshot.pl"){
      copy($file, ".snapshot.$n") or die "copy failed";
    }
  }
} elsif ($ARGV[0] eq "load"){

}
