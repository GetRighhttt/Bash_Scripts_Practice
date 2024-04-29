#!/bin/bash

# While Loops

myvar=1

while [ $myvar -le 5 ];
do
	echo "$myvar"
	((myvar++))
	sleep 0.3
done

myfile=1

while [ -f ~/runApp.sh ];
do
	echo "As of $(date) file exists."
	break
done

echo "The file no longer exists at $(date)...exiting..."

# Until

i=1  
until [ $i -ge 6 ]  
	do  
	echo $i  
	((i++))
	sleep 1  
done  
