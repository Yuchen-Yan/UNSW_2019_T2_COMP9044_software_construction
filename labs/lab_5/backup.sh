#!/bin/sh

file=$1
num="-1"
for f in "."*;do
  #echo $f
  if [[ "$f" =~ ^.$file.* ]];then
    now=`echo "$f"|sed "s/[^0-9]//g"`
    if test $now -gt $num;then
      num=$now
    fi
  fi
done

if test $num -eq "-1";then
  cat "$file" > ".$file.0"
  echo "Backup of '$file' saved as '.$file.0'"
else
  num=$((num+1))
  cat "$file" > ".$file.$num"
  echo "Backup of '$file' saved as '.$file.$num'"
fi
