#!/usr/bin/perl -w
if(scalar(@ARGV) == 0){
  while($l = <>){
    push @lines, $l;
  }
  if (scalar(@lines) < 10){
    for ($i = scalar(@lines); $i > 0; $i--){
      print "$lines[-$i]";
    }
   } else {
    for ($i = 10; $i > 0; $i--){
      print "$lines[-$i]";
    }
  }
} else {
 #If there is a num of line indicator
 if ($ARGV[0] =~ /-[0-9]+/){
   $ARGV[0] =~ s/-//;
   $l_f = $ARGV[0];
 #Only one file
   if (scalar(@ARGV) == 2){
     open F, '<', $ARGV[1] or die "$0: Can't open $ARGV[1]: $!\n";
     while($l = <F>){
       push @lines, $l;
     }
     if (scalar(@lines) < $l_f){
       for ($i = scalar(@lines); $i > 0; $i--){
         print "$lines[-$i]";
       }
      } else {
       for ($i = $l_f; $i > 0; $i--){
         print "$lines[-$i]";
       }
     }
     close F;
 #More than one file
    } else {
     foreach $file(@ARGV[1..scalar(@ARGV)-1]){
       @lines = ();
       open F, '<', $file or die "$0: Can't open $file: $!\n";
       print "==> $file <==\n";
       while($l = <F>){
         push @lines, $l;
       }
       if (scalar(@lines) < $l_f){
         for ($i = scalar(@lines); $i > 0; $i--){
           print "$lines[-$i]";
         }
       } else {
         for ($i = $l_f; $i > 0; $i--){
           print "$lines[-$i]";
         }
       }
       close F;
     }
   }

 #output last of ten lines
 } else {
   #Only one file
     if (scalar(@ARGV) == 1){
       open F, '<', $ARGV[0] or die "$0: Can't open $ARGV[0]: $!\n";
       while($l = <F>){
         push @lines, $l;
       }
       if (scalar(@lines) < 10){
         for ($i = scalar(@lines); $i > 0; $i--){
           print "$lines[-$i]";
         }
       } else {
         for ($i = 10; $i > 0; $i--){
           print "$lines[-$i]";
         }
       }
       close F;
   #More than one file
     } else {
       foreach $file(@ARGV[0..scalar(@ARGV)-1]){
         @lines = ();
         open F, '<', $file or die "$0: Can't open $file: $!\n";
         print "==> $file <==\n";
         while($l = <F>){
           push @lines, $l;
         }
         if (scalar(@lines) < 10){
           for ($i = scalar(@lines); $i > 0; $i--){
             print "$lines[-$i]";
           }
         } else {
           for ($i = 10; $i > 0; $i--){
             print "$lines[-$i]";
           }
         }
         close F;
       }
     }
 }
}
