#!/bin/bash
#title: Nested If-else conndtion
#Description: More then two number
#author: Jagadeesh
#date: 15-01-24
#Version: V0.1

echo "Nested if-else demo start"
a=10
b=20
c=30

if [[ ($a -gt $b && $a -gt $c) ]]
then 
    echo "$a is bigger then $b and $c"
elif [[ ($b -gt $a && $b -gt $c) ]]
then
     echo "$b is bigger then $a and $c"
else
    echo "$c is bigger then $a and $b"
fi