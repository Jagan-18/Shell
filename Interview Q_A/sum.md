## Sum

### Objectives

1. Write a script that gets two numbers and prints their sum
3. Make sure the input is valid (= you got two numbers from the user)
2. Test the script by running and passing it two numbers as arguments 

### Constraints

1. Use functions

### Solution

```
#!/usr/bin/env bash

re='^[0-9]+$'

if ! [[ $1 =~ $re && $2 =~ $re ]]; then
    echo "Oh no...I need two numbers"
    exit 2
fi

function sum {
    echo $(( $1 + $2 ))
}

sum $1 $2
```


#____________________________________________#

```
#!/bin/bash

# Function to check if the input is a valid number
is_number() {
  [[ "$1" =~ ^-?[0-9]+(\.[0-9]+)?$ ]]
}

# Get two numbers from the user
echo "Enter the first number:"
read num1

# Validate the first input
if ! is_number "$num1"; then
  echo "Error: '$num1' is not a valid number."
  exit 1
fi

echo "Enter the second number:"
read num2

# Validate the second input
if ! is_number "$num2"; then
  echo "Error: '$num2' is not a valid number."
  exit 1
fi

# Calculate and print the sum
sum=$(echo "$num1 + $num2" | bc)
echo "The sum of $num1 and $num2 is: $sum"

```