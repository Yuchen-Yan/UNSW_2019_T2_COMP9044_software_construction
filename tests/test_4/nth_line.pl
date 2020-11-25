#!/usr/bin/perl -w

open F, '<' , "$ARGV[1]";
for ($s = 1; $s < $ARGV[0]; $s++){
 $line=<F>;
 if (!$line){
   exit 0;
 }
}
$line=<F>;
if (!$line){
    exit 0;
}

print "$line";
close F;
