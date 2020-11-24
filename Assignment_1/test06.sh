#!/bin/sh


sh legit-init
echo a b c d e f g
sh legit-add a b c d e f
sh legit-commit -m "first commit"
sh legit-rm --cached a b c d e f
sh legit-rm a b c d e f
sh legit-log
sh legit-status
