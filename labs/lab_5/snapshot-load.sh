#!/bin/dash

chmod +x "snapshot-save.sh"
sh "snapshot-save.sh"

cp -a ".snapshot.$1/." .
echo "Restoring snapshot $1"
