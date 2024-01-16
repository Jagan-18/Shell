#!/bin/bash

#Basic read command
echo -n "Enter your name: " 
read name
echo "Your name is $name"

#Using -p Option
read -p 'Enter your name: ' name
echo "Your name is $name"

#Using -s Option to read
read -s -p "Enter Password: " Pass
echo "Password is $pass"


#
echo "please enter the devops tools using"
read -a devopstools
echo "The 2nd element is: " ${devopstools[3]}
echo "the devops tools using in project: " ${devopstools[*]} 