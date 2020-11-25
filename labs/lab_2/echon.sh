#!/bin/sh

if test $# -eq 2;then
  if [[ "$1" =~ ^[0-9]+$ ]];then
    if test $1 -eq 0; then
      break
    else
      for i in $(seq 1 $1);do
        echo "$2"
      done
    fi
  else
    echo "./echon.sh: argument 1 must be a non-negative integer"
  fi
else
  echo "Usage: ./echon.sh <number of lines> <string>"
fi
