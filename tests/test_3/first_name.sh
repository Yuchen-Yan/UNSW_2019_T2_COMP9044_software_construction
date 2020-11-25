#!/bin/sh

most_common_first_name=`egrep 'COMP[29]041' "$1" |  cut -d'|' -f3 | cut -d',' -f2 | cut -d' ' -f2 | sort | uniq -c | sort -r| head -1 | sed -e 's/[^a-zA-Z]//g'`
echo "$most_common_first_name"
