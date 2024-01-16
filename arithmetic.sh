#!/bin/bash
#Program to demonstrate arithemetic operation

echo "Demonstration of Arithmetic Operation"
read -p "Enter the first number :" n1
read -p "Enter the secound number :" n2
echo "Addition :" $((n1+n2))
echo "Subtraction :" $((n1-n2))
echo "Multiplication :" $((n1*n2))
echo "Division :" $((n1/n2))
echo "Modulus :" $((n1%n2))

###########################
echo "The addition of 10 and 20 is : " `expr 10 + 20`
expr 10 - 20
expr 10 / 20
expr 10 \* 20
expr 10 % 20

#######################################

#Program to demonstrate relational operation:
echo "Demonstration of Relational Operation using If-else condtion"
read -p "Enter the first number :" a1
read -p "Enter the secound number :" a2
if [ $a1 -gt $a2 ]
then
 echo "a1 > a2"
else
 echo "a1 < a2"
fi

