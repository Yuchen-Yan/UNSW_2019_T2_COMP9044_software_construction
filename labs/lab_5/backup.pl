#!/usr/bin/perl -w
use File::Copy;

$dirname = '.';
opendir(DIR, $dirname) or die "Could not open $dirname\n";
$now = -1;
while ($file = readdir(DIR)){
  if ($file =~ /.$ARGV[0].*/){
    $file =~ s/[^0-9]*//;
    if ($file > $now){
      $now = $file;
    }
  }
}

if ($now == -1){
  $new_file = ".$ARGV[0].0";
  copy("$ARGV[0]", "$new_file") or die "Copy failed!";
  print "Backup of '$ARGV[0]' saved as '$new_file'\n";
} else {
  $now = $now + 1;
  $new_file = ".$ARGV[0].$now";
  copy("$ARGV[0]", "$new_file") or die "Copy failed!";
  print "Backup of '$ARGV[0]' saved as '$new_file'\n";
}
