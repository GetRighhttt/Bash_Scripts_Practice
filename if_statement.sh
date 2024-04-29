#!/bin/bash


# If statement basics

# Equals -eq, greater than -gt, not equals -ne, less than -lt, ! = not, string : !=, ==

mynum=200

if [ $mynum -eq 200 ] && [ ! $mynum -gt 100 ];
then
	echo "the condition is true"
else
	echo "the condition is false"
fi

# If-else statement
read -p "Enter new number: " new_number
if [ $new_number -gt $mynum ];
then
	echo "New number is greater than old number"
else
	echo "New number is less than old number"
fi


# Nested if statements
read -p "Enter another number: " another_number
read -p "Enter in another number: " newest_number

if [ $another_number -gt 10 ];
then
	if [ $newest_number -gt 10 ];
	then
		echo "Both numbers are positive and greater than 10"
	else
		echo "Both numbers are not greater than 10..."
	fi
else echo "Number isn't greater than 10"

fi
