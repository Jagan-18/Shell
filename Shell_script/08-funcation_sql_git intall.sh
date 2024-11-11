#!/bin/bash

Hello() {
    echo "Hello!!! $1"
    echo "Script Name: $0"
    echo "Number of args: $#"
    echo "All args are: $@"
}

echo "Before calling function, checking name: $1"
echo "Number of args: $#"
echo "All args are: $@"
Hello $1

#parameters passed to the script are by default not accessible inside function

#_______________________________________________________________________________#

###  Install MySQL and Git through a Shell Script through Funcation staments

#!/bin/bash

ID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "ERROR :: $2 ...FAILED"
        exit 1
    else
        echo "$2 ....Success"
    fi
}

if [ $ID -ne 0 ]; then
    echo "ERROR :: Please run this script with root access"
    exit 1
else
    echo "You are running as the root user"
fi

# Install MySQL
yum install mysql -y
VALIDATE $? "Installing MySQL"

# Install Git
yum install git -y
VALIDATE $? "Installing Git"
