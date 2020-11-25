#!/usr/bin/perl -w


#if the argment is not -d
if ($ARGV[0] !~ '-d'){
  %song_fre_sum = ();
  @files = <lyrics/*>;
  %file_string = ();

  %song_words = ();
  foreach $song(@ARGV){
    open F, "<", "$song" or die "Can't open this file";
    $all_words = "";
    while ($line = <F>){
      $all_words .= $line;
    }
    close F;
    $song_words{"$song"} = "$all_words";
  }


  foreach $f(@files){
    open F, "<", "$f" or die "Can't open this $file\n";
    $al = "";
    while ($line = <F>){
      $al .= $line;
    }
    close F;
    $f =~ s/(.txt)//;
    $f =~ s/(lyrics\/)//;
    $f =~ s/_/ /g;
    $file_string{"$f"} = "$al";
  }




#iterate each song file
  foreach $song(keys %song_words){
    #caculate the words in a song file

    @all_w = split(/[^a-zA-Z]+/, $song_words{$song});
    #iterate each music file
    while (($file, $all) = each %file_string){
      $sum_fre = 0;
      #iterate each word in song?.txt and caculate the sum_fre
      foreach $word(@all_w){
        @a = split(/[^a-zA-Z]+/,$all);
        $n_file = scalar(@a) - 1;
        $n_n = 0;
        for ($i = 0; $i < $n_file; $i++){
          if ($a[$i] =~ /^$word$/i ){
            $n_n++;
          }
        }
        $fre = log(($n_n+1)/ $n_file);
        $fre = sprintf("%.4f",$fre);
        $sum_fre += $fre;
      }
      $sum_fre = sprintf("%.1f", "$sum_fre");
      $song_fre_sum{"$song"}{"$file"} = $sum_fre;
      #print "$song: $file: $sum_fre\n"
    }
  }






  #find out the most log_probability and print it out;
  foreach $song(keys %song_fre_sum){
    $m_log = -10000;
    $m_singer = "";
    my $ref = $song_fre_sum{$song};
    foreach $singer(keys %$ref){
      if ($song_fre_sum{$song}{$singer} > $m_log){
        $m_log = $song_fre_sum{$song}{$singer};
        $m_singer = $singer;
      }
    }
    print "$song most resembles the work of $m_singer (log-probability=$m_log)\n";
  }

} else{
  print "-d";
}
