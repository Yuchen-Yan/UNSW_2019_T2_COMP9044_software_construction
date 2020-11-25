#!/bin/sh

S=""
M=""
L=""

for f in *;do
  if test `wc -l $f| sed s/[^0-9]//g` -lt 10 ;then
    S="$S $f"
  elif test `wc -l $f| sed s/[^0-9]//g` -lt 100;then
    M="$M $f"
  elif test `wc -l $f| sed s/[^0-9]//g` -ge 100;then
    L="$L $f"
  fi
done

echo "Small files:$S"
echo "Medium-sized files:$M"
echo "Large files:$L"
