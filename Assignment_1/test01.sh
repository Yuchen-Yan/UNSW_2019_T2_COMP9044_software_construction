#!/bin/sh

#this test aim to test all of the files in subset 0 and 1, which has no error occurs

sh legit-init
touch a b c d e
sh legit-add a b c d e
sh legit-commit -m "first commit"
sh legit-log
sh legit-show 0:a
sh legit-show :a
