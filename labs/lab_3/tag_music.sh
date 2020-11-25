#!/bin/sh

for directory in "$@";do
    if [[ "$directory" =~ \/$ ]];then
        directory=`echo $directory | sed -e "s/\/$//g"`
    fi
    for file in "$directory"/*;do
        title=`echo $file | cut -d'/' -f3 | sed 's/^.* - \(.*\) - .*$/\1/'`

        artist=`echo $file | cut -d'/' -f3 | sed 's/^.* - .* - \(.*\).mp3$/\1/'`

#echo "$file"
#echo "$title"
#echo "$artist"

        track=`echo $file | cut -d'/' -f3 | cut -d'-' -f1`

        album=`echo $file | cut -d'/' -f2`

        year=`echo $file | cut -d',' -f2 | cut -d'/' -f1 | sed -e 's/^ //g'`

        id3 -t "$title" -a "$artist" -T "$track" -A "$album" -y "$year" "$file" > /dev/null

   done
done
