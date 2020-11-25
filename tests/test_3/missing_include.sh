#!/bin/sh


for file in "$@";do
  if [[ "$file" =~ '(.sh)$' ]]; then
    continue
  fi
  includes=`egrep '#include ".*"' $file | cut -d'"' -f2`
  for line in $includes;do
    find="0"
    for f in *;do
      if [[ $f =~ ^$line$ ]];then
        find="1"
      fi
    done
    if test $find -eq 0;then
      echo "$line included into $file does not exist"
    fi

  done
done
