###  Install MySQL through a Shell Script.

/*
Steps:
====
1. Check if the user is root.
2. If the user is root, then check if the user ID is not equal to 0.
If it is not equal to 0, then it indicates that it is not the root user.
- Proceed with the installation if the user is root.
- If not root, stop the script and prompt the user to run it with root access.
3. Now, install MySQL.
4. Check if MySQL was installed properly.
5. If the installation is successful:
- Print a success message.
- If not successful, display the error message encountered during installation.
*/

#!/bin/bash

# Step 1: Check if the user is root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run with root privileges. Please run as root."
    exit 1 # Exit with status 1 to indicate an error
fi

# Step 3: Install MySQL
echo "Installing MySQL..."

# Update package index (for Debian/Ubuntu)
apt-get update

# Install MySQL server (for Debian/Ubuntu)
if ! apt-get install -y mysql-server; then
    echo "MySQL installation failed."
    exit 2 # Exit with status 2 to indicate an installation error
fi

# Step 4: Check if MySQL was installed properly
if ! systemctl status mysql >/dev/null; then
    echo "MySQL service is not running. There may have been an installation issue."
    exit 3 # Exit with status 3 for service not running
fi

# Step 5: Success message
echo "MySQL installed successfully and is running."

### Other Steps:

#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ]; then
    echo "ERROR:: Please run this script with root access"
    exit 1 # you can guve other than 0
else
    echo "you are root user"
fi # fi means reverse of if , indicating condition end.

yum install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installinf MYSQL is failed"
    exit 1
else
    echo "Installing MYSQL is success"
fi
