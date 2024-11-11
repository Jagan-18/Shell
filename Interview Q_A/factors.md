## Shell Scripting - Factors

### Objectives

Write a script that when given a number, will:

* Check if the number has 2 as factor, if yes it will print "one factor"
* Check if the number has 3 as factor, if yes it will print "one factor...actually two!"
* If none of them (2 and 3) is a factor, print the number itself

### Solution

```
#!/usr/bin/env bash

(( $1 % 2 )) || res="one factor"
(( $1 % 3 )) || res+="...actually two!"

echo ${res:-$1}
```
### Explanation of your code:
### (( $1 % 2 )) || res="one factor": This checks if $1 (the input number) is divisible by 2. If it is divisible by 2, it sets res="one factor". If $1 % 2 is 0, the || (OR) operator will execute the second part and assign "one factor" to res.
### (( $1 % 3 )) || res+="...actually two!": This checks if $1 is divisible by 3. If it is, it appends "...actually two!" to res.
### echo ${res:-$1}: This prints the value of res if it's set. If res is empty (i.e., neither 2 nor 3 is a factor), it defaults to printing $1 (the input number itself).


### ---------------------------------------------------------------------

```
#!/usr/bin/env bash

# Initialize res as an empty string
res=""

# Check divisibility by 2
(( $1 % 2 == 0 )) && res="one factor"

# Check divisibility by 3 and append to res if needed
(( $1 % 3 == 0 )) && res+="...actually two!"

# If res is still empty, print the number itself
echo ${res:-$1}

```