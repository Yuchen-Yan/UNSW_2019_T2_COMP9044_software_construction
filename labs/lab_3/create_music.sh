#!/bin/sh

mkdir "$2/"

for i in {1993..2018};do
  str="$2/Triple J Hottest 100, $i"
  mkdir "$str"
done

for file in "$2/"*; do
  year=`echo $file | cut -d' ' -f5`
  n_year=$((year+1))

  content=`curl -slient "https://en.wikipedia.org/wiki/Triple_J_Hottest_100#Hottest_100_top_tens_and_summaries" | awk "/(Triple J Hottest 100, "$year"\">"$year")/{flag=1; next} /(Triple J Hottest 100, "$n_year"\">"$n_year")/{flag=0} flag" | awk "/<ol>/, /<\/ol>/" |sed -e "s/<[^>]*>//g"`

  i="1"
  while IFS= read -r line;do
    if test $i -gt 10; then
      break
    fi
    musician=`echo "$line"|cut -d'"' -f1| sed -e "s/–//g" | sed -e "s/ $//g" | sed -e "s/ $//g"`
    music=`echo "$line"|cut -d'"' -f2- | sed -e 's/"//g' | sed -e 's/^ //g' | sed -e 's/\//-/g'`


    if [[ "$musician" =~ (amp;) ]];then
        musician=`echo $musician | sed -e 's/amp;//g'`
    fi
    if [[ "$music" =~ (amp;) ]];then
        music=`echo $music | sed -e 's/amp;//g' `
    fi

    song="$i - $music - $musician.mp3"
    i=$((i+1))


    cp "$1" "$file/$song"
  done <<< "$content"

done


