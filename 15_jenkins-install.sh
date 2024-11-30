#!/bin/bash

USERID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $USERID -ne 0 ]; then
    echo "You need to be root user to execute this script"
    exit 1
fi

# Update YUM repositories and packages
yum update -y
VALIDATE $? "Updating YUM"

# Download Jenkins repository configuration
wget -O /etc/yum.repos.d/jenkins.repo \ https://pkg.jenkins.io/redhat-stable/jenkins.repo

VALIDATE $? "Adding Jenkins Repo"

# Import Jenkins GPG key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

VALIDATE $? "Import Jenkin key"

# Upgrade YUM packages
yum upgrade -y
VALIDATE $? "Upgrading YUM packages"

# Install OpenJDK 11
amazon-linux-extras install java-openjdk11 -y
VALIDATE $? "Installing OpenJDK 11"

# Install Jenkins
yum install jenkins -y
VALIDATE $? "Installing Jenkins"

# Enable Jenkins service
systemctl enable jenkins
VALIDATE $? "Enable Jenkins"

# Start Jenkins service
systemctl start jenkins
VALIDATE $? "Starting Jenkins"
