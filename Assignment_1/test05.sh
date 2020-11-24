#!/bin/sh

sh legit-init
seq 1 7 >7.txt
sh legit-add 7.txt
sh legit-commit -m commit-1
sh legit-branch b1
sh legit-checkout b1
perl -pi -e 's/2/42/' 7.txt
cat 7.txt
sh legit-commit -a -m commit-2
sh legit-checkout master
cat 7.txt
perl -pi -e 's/5/24/' 7.txt
sh legit-commit b1 -m merge-message
