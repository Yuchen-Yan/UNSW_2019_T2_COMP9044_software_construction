#!/bin/sh


for file in *;do
    if [[ "$file" =~ .jpg$ ]] ; then
        name=`echo $file|sed -e s/.jpg//g`
        convert $name.jpg $name.png
    fi
done
