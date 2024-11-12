#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S) # Corrected 'data' to 'date'
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>>$LOGFILE

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 .... $R FAILED $N"
    else
        echo -e "$2 .... $G Success $N"
    fi
}

if [ $ID -ne 0 ]; then
    echo -e "$R Error:: Please run this script with root access $N"
    exit 1
else
    echo "You are the root user"
fi

# Check if any packages are provided
if [ $# -eq 0 ]; then
    echo -e "$R Error:: No packages specified for installation $N"
    exit 1
fi

for package in "$@"; do                         # Use quotes to handle package names with spaces
    yum list installed "$package" &>>"$LOGFILE" # Check if installed
    if [ $? -ne 0 ]; then                       # If not installed
        yum install "$package" -y &>>"$LOGFILE" # Install the package
        VALIDATE $? "Installation of $package"  # Validate
    else
        echo -e "$package is already installed .... $Y Skipping $N"
    fi
done
