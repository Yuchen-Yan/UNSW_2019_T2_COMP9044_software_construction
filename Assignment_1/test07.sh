#!/bin/sh


sh legit-init
echo line1 > 1.txt
sh legit-add 1.txt
sh legit-commit -m commit-1
echo line2 >> 1.txt
sh legit-commit -a -m commit-2
sh legit-branch b1
sh legit-scheckout b1
perl -pi -e 's/"line1"/"line3"/' 1.txt
cat 1.txt
sh legit-commit -a -m commit-3
sh legit-checkout master
cat 1.txt
perl -pi -e 's/"line3"/"line10"/' 1.txt
sh legit-commit -a -m commit-4
sh legit-merge b1 -m merge-message
