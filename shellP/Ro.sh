## How to read a vlaue at runtime in shell scripting?

1. Read basic input
------------------ 
#!/usr/bin/env bash -----> Are we can give sh 

#Give user name.
echo "Enter you name:"
read name

echo "Hi , $name! welcome to IBM."

------------------------------
2. Using -p Option for prompt

#!/usr/bin/bash

#Prompt user for input with a custom prompt.

read -p "Enter your Age: " age

echo "You entered: $age years old."

-----------------------------------------

3. Read the input one after another

#!/bin/bash

#Prompt user for their details

echo "Please enter your name:"
read name

echo "Please enter your working company"
read company

#output a summary of the entered details
echo "Hello. $name! I am wokring in $company."

------------------------------------------------
4. Reading Input with Timeout.

#!/bin/bash

#prompt user for input with a timeout
read -t 10 -p "Enter your password within 10seconds: " password

if [-z "$password" ]; then
    echo "No password entered with in 10 seconds."
else
   echo "password entered: $password"
fi

-------------------------------------------------------
6. Reading Input Silently (password Input)

#!/bin/bash

#prompt user for password input (Silent)
read -s -p "Enter your password: " password
echo #Move to a new line after pasword input

#validate or process the password input
echo "Password entered."



