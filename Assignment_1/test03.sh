#!/bin/sh


#this scropt is aim to run throw the subset0 and with some errors occurs
sh legit-init
touch a b c d e f
sh legit-add a b c d e f
sh legit-commit -m "first commit"
touch g h
sh legit-commit -m "first commit"
sg legit-log
sh legit-show :a
sh legit-show :b
sh legit-show :c
echo "this is a test" >> a
sh legit-add a
sh legit-commit -m "second commit"
sh legit-show 1:a
