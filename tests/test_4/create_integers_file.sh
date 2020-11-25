#!/bin/sh
touch "$3"
s=$1
e=$2
while test "$s" -le "$e";do
  echo "$s" >> "$3"
  s=$(( s+1 ))
done
