#!/bin/sh

while read -r line;do
  echo "$line" | tr '[0-4]' '<' | tr '6-9' '>'
done
