#!/bin/dash

num=-1
cur=-1
for file in ".snapshot"*;do
  if [ "$file" = ".snapshot*" ];then
    #echo "lalala"
    break
  fi
  #echo $file
  cur=`echo $file|sed 's/[^0-9]//g'`
  if test $cur -gt $num;then
    num=$cur
  fi
done
if test $num -eq -1;then
  num=$(( num + 1 ))
  mkdir ".snapshot.0"
  echo "Creating snapshot 0"
else
  num=$(( num + 1 ))
  mkdir ".snapshot.$num"
  echo "Creating snapshot $num"
fi

for f in *;do
  if [ "$f" = "snapshot-load.sh" ];then
    continue
  elif [ "$f" = "snapshot-save.sh" ];then
    continue
  fi
  cp "$f" ".snapshot.$num"
done
