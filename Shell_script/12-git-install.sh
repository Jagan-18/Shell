#Instaling git server.

#!/bin/bash

USERID=$(id -u)

#check user is root or not
if [ $USERID -ne 0 ]; then
    echo "You need to be root user to execute this script"
    exit 1
fi

# Install Git
echo "Installing Git..."
yum install git -y

# Check if the installation was successful
if [ $? -ne 0 ]; then
    echo "Installing Git is failure"
    exit 1
else
    echo "Installing Git is success"
fi

#_____________________________________#
#Method:2

#!/bin/bash

# Exit on any error
set -e

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "You need to be root to execute this script."
    exit 1
fi

# Install Git
echo "Installing Git..."
yum install git -y

echo "Git installed successfully."

#Explanation:
# set -e: Stops the script on any error (i.e., if any command fails).
# The script is shorter and doesn't require manual checking of the yum install command's result ($?), as set -e handles it.
