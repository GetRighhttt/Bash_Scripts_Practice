#!/bin/bash

# if file statement

# if file exists as a regular file -f
# if file exists regardless of the type -e

if [ -f ~/runApp.sh ];
then
	echo "The file exists."
else
	echo "The file doesn't exists."
fi


# if directory exists -d

File=Development
[ -d "$File" ] && echo "$File is a directory"

read -p "Enter file name: " new_file
if [ -e $new_file ]; then
	echo "file exists"
else echo "file doesn't exists..."
fi
