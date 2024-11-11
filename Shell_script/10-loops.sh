###  loops in shell scripting using for, while, and until

### For Loop : This example prints numbers from 1 to 10.

#Example1
#!/bin/bash

# For loop to print numbers from 1 to 10
for ((i = 1; i <= 10; i++)); do
    echo "Number: $i"
done

##Example2: The for loop iterates over a list of items.
#!/bin/bash
for i in {1...100}; do
    echo "$i"
done

### Example3 : This example iterates over a list of items.
#!/bin/bash

# Example of a for loop
for fruit in apple banana cherry; do
    echo "I like $fruit"
done

#-------------------------------#
### While Loop : This example continues to prompt for user input until a specific condition is met.
#!/bin/bash

# Example of a while loop
count=1
while [ $count -le 5 ]; do
    echo "Count is: $count"
    ((count++)) # Increment count
done

## Example:2 This example calculates the sum of numbers from 1 to 5.

#!/bin/bash

# Initialize sum and counter
sum=0
count=1

# While loop to calculate sum
while [ $count -le 5 ]; do
    sum=$((sum + count))
    ((count++)) # Increment counter
done

echo "Sum of numbers from 1 to 5 is: $sum"

### Nested Loops:You can nest loops for more complex iterations.
#!/bin/bash

for i in {1..3}; do
    for j in {A..C}; do
        echo "i: $i, j: $j"
    done
done

#______________#
### break and continue :
1. break exits the loop.
2. continue skips to the next iteration.

#!/bin/bash

for i in {1..5}; do
    if [ $i -eq 3 ]; then
        continue # Skip iteration when i equals 3
    fi
    echo "Iteration $i"
done

#______________________________________#
# Example: Script with All Loops

#!/bin/bash

# For loop
echo "For Loop:"
for i in {1..3}; do
    echo "Iteration $i"
done

# While loop
echo "While Loop:"
count=1
while [ $count -le 3 ]; do
    echo "Count is $count"
    ((count++))
done

# Until loop
echo "Until Loop:"
count=1
until [ $count -gt 3 ]; do
    echo "Count is $count"
    ((count++))
done

# Looping through command output
echo "Looping through files:"
for file in *.txt; do
    echo "Found file: $file"
done

#_______________________________________________#
#!/bin/bash

USERID=$(id -u)
DATE=$(date +"%F-%H-%M-%S")
LOG_FILE="$DATE.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
#check user is root or not
if [ $USERID -ne 0 ]; then
    echo "Please run this script with root user access"
    exit 1
fi

#this is a generic function, we need to pass arguments
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

for PACKAGE in $@; do #sample input: git vim net-tools wget
    yum -q list installed $PACKAGE &>/dev/null
    if [ $? -ne 0 ]; then
        echo "$PACKAGE ... Not Installed"
        yum install $PACKAGE -y &>>$LOG_FILE
        VALIDATE $? "$PACKAGE Installation"
    else
        echo -e "$PACKAGE ... $Y Installed already $N"
    fi
done
#_______________________________________________#
