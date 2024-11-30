#!/bin/bash

USERID=$(id -u)
DATE=$(date +%F)
LOG="jenkins-install-${DATE}.log"
R="\e[31m" # Red color
G="\e[32m" # Green color
N="\e[0m"  # No color

# Function to validate the last command and log the result
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 ... ${R} FAILURE ${N}" 2>&1 | tee -a $LOG
        exit 1
    else
        echo -e "$2 ... ${G} SUCCESS ${N}" 2>&1 | tee -a $LOG
    fi
}

# Ensure script is being run as root
if [ $USERID -ne 0 ]; then
    echo -e ${R} "You need to be root user to execute this script "${N}
    exit 1
fi

# Log system update
yum update -y &>>$LOG
VALIDATE $? "Updating YUM"

# Add Jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo \ https://pkg.jenkins.io/redhat-stable/jenkins.repo &>>$LOG
VALIDATE $? "Adding Jenkins Repo"

# Import Jenkins GPG key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key &>>$LOG
#rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key &>>$LOG
VALIDATE $? "Import Jenkin key"

# Upgrade YUM packages
yum upgrade -y &>>$LOG
VALIDATE $? "Upgrade YUM"

# Install OpenJDK 11
amazon-linux-extras install java-openjdk11 -y &>>$LOG
VALIDATE $? "Installing OpenJDK 11"

# Install Jenkins
yum install jenkins -y &>>$LOG
VALIDATE $? "Installing Jenkins"

# Enable Jenkins service to start at boot
systemctl enable jenkins &>>$LOG
VALIDATE $? "Enable Jenkins"

# Start Jenkins service
systemctl start jenkins &>>$LOG
VALIDATE $? "Starting Jenkins"

# If you want to log additional checks or commands, use VALIDATE
# Example: Checking Jenkins service status
# systemctl status jenkins &>>$LOG
# VALIDATE $? "Checking Jenkins service status"

# Final message
echo -e "${G}Jenkins installation completed successfully!${N}"
