#!/bin/sh


for file1 in "$1/"*;do
  f1=`echo "$file1" | sed -e "s/$1\///g"`
  for file2 in "$2/"*;do
    f2=`echo "$file2" | sed -e "s/$2\///g"`
    if [ "$f1" = "$f2" ];then
      if [ -f "$file1" -a -f "$file2" ];then
        diff=`diff "$file1" "$file2"`
        empty=""
        if [ "$diff" = "$empty" ];then
          echo "$f1"
        fi
      fi
    fi
  done
done
