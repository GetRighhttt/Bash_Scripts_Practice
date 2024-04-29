#!/bin/bash

# Reading in User Input


# Using read command
echo "Enter a new name:"
read new_name
echo "The name entered is: $new_name"

# Using $REPLY
echo "Enter another name:"
read
echo "Name entered is: $REPLY"

# Using -p to read from same prompt
read -p "Another Name:" another_name
echo "The other name is: " $another_name

# Using -sp to read in silent for passwords, etc.
read -p "Username:" user_name
read -sp "Password:" password
echo
echo "username : " $user_name
echo "password : " $password

# Reading in an array of names using -a
echo "Enter Two Names: "
read -a names
echo "Entered names are : ${names[0]}, ${names[1]}"
echo $?
