#!/usr//bin/perl -w

@array = ();
for ($i = 0; $i < scalar(@ARGV); $i++){
  if ($ARGV[$i] =~ /[aeiouAEIOU]{3}/){
    push @array, $ARGV[$i];
  }
}
$string = join(' ', @array);
print "$string\n";
