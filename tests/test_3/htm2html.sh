#!/bin/sh

exits="0"
for file in *;do
  if [[ "$file" =~ (.htm)$ ]];then
    for other in *;do
      if [[ "$other" =~ $file"l" ]];then
        echo "$other exists"
        exits="1"
      fi
    done
    if test $exits -eq 1;then
      continue
    fi

    new=$file"l"
    cp "$file" "$new"
    rm "$file"
  fi
done
if test $exits -eq 1;then
  exit 1
fi
