#!/bin/sh

for file in "$@"
do
	if [[ "$file" =~ '.sh$' ]];then
		continue
	else
		display "$file"	
	fi

	echo -n "Address to e-mail this image to? "
	read email
	echo -n "Message to accompany image? "
	read message

	subject=`echo $file | cut -d'.' -f1`
	echo "$message" | mutt -s '$subject' -e 'set copy=no' -a "$file" -- "$email"
	echo "$file" sent to "$email"
done
