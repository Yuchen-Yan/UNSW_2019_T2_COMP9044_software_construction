#!/bin/sh


sh legit-init
touch a b c d e f g h
sh legit-add a b c d e f
sh legit-commit -m "first commit"
echo hello >a
echo hello >b
echo hello >c
sh legit-add a b
echo world >a
rm d
sh legit-rm e
sh legit-add g
sh legit-status
