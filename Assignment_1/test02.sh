#!/bin/sh

#this test is aim to  run throw subset 0 with nno error occurs

sh legit-init
echo line1 > a
echo 2 > b
echo 3 > c
sh legit-add a b c
sh legit-commit -m "first commit"
echo line2 >> a
sh legit-add a
sh legit-commit -m "second commit"
sh legit-log
echo line3 >> a
sh legit-add a
sh legit-show 0:a
sh legit-show 1:a
sh legit-show :a
