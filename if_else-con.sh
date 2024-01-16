#!/bin/bash

a=10
b=20

if [ $a -gt $b]
then
    echo "$a is the biggerthan $b"
else 
   echo "$a is lessenthan $b"
fi

##############
#program to demonstrate if-else condition :

#!/bin/bash
echo "Program to check whether you are eligible to vote using if-else"
read -p "enter your age" age
if [ $age >= 18 ] 
then
 echo "you are eligible to vote "
else
 echo "you are not eligible to vote"
fi
 (OR)
#!/bin/bash
echo "Program to check whether you are eligible to vote using if-else"
read -p "enter your age" age
if [ $age >= 18 ] 
then
 echo "you are eligible to vote. "
elif [ $age = 18 ]
then
 echo "please apply for voter id card."
else
 echo "you are not eligible to vote."
fi