#!/bin/bash

# Variables
# lowercase variable names are proper etiquette
myName="Stefan"
yourName="Ayesha"

myAge="29"
yourAge="38"

echo "Hello, my name is $myName, and your name is $yourName."
echo "I'm $myAge years old and you are $yourAge years old."

echo "Nice to meet you!"

# Using variables as output
echo "Let's print the date... "
now=$(date)
echo "The system time and date is: "
echo $now

# Printing username using default variables.
# There's some variables that are always there in the environment that are
# typically uppercase and built-in

name="Stefan"
later=$(date)
echo "Hello $name, the date and time is $later..."
echo "Your username is $USER."
echo "Your home path is $HOME."

