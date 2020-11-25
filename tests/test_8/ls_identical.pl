#!/usr/bin/perl -w


@files1 = glob("$ARGV[0]/*");
@files2 = glob("$ARGV[1]/*");

foreach $file1(@files1){
  $f1 = $file1;
  $f1 =~ s/$ARGV[0]\///;

  foreach $file2(@files2){
    $f2 = $file2;
    $f2 =~ s/$ARGV[1]\///;


    if ( $f1 eq $f2 ){
      open F1, "<", "$file1" or die "Can't open";
      $string = "";
      while($line = <F1>){
        $string .= $line;
      }
      close F1;


      open F2, "<", "$file2" or die "Can't open";
      $string2 = "";
      while($line2 = <F2>){
        $string2 .= $line2;
      }
      close F2;

      if ( $string eq $string2 ){
        print "$f1\n";
      }


    }
  }
}
