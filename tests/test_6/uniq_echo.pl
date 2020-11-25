#!/usr/bin/perl -w

use List::MoreUtils qw(uniq);

my @unique_words = uniq @ARGV;

print "@unique_words\n";
