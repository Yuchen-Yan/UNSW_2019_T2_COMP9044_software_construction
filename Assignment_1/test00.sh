#!/bin/sh

sh legit-init
sh legit-init
echo 1 > a
echo 2 > b
echo 3 > c
echo 4 > d
echo 5 > e
sh legit-add a b c d e
sh legit-commit -m "first commit"
sh legit-log
sh legit-show 0:a
sh legit-show 0:b
echo "1-1" >>a
echo "2-2" >>b
sh legit-commit -a -m "second commit"
sh legit-status
sh legit-rm a b c
sh legit-status
