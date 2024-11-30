#!/bin/bash
set -eE -o functrace

# Error handling function
failure() {
    local lineno=$1
    local msg=$2
    echo "Failed at line $lineno: $msg"
}
trap 'failure ${LINENO} "$BASH_COMMAND"' ERR

# Ensure the script is run as root
USERID=$(id -u)
LOGFILE="docker-install.log"

R="\e[31m"
N="\e[0m"
G="\e[32m"

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root access $N"
    exit 1
fi

# Check if Docker is already installed
if command -v docker &>/dev/null; then
    echo -e "$G Docker is already installed. Skipping installation. $N"
    exit 0
fi

# Install required packages
yum install -y yum-utils &>>$LOGFILE
echo -e "yum-utils ... $G Installed $N"

# Add Docker repository
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo &>>$LOGFILE
echo -e "Adding Docker repo ... $G Done $N"

# Install Docker packages
yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin &>>$LOGFILE
echo -e "Docker Engine ... $G Installed $N"

# Start Docker
echo "Starting Docker"
systemctl start docker &>>$LOGFILE
echo "Docker started successfully."

# Enable Docker to start on boot
echo "Enabling Docker to start on boot"
systemctl enable docker &>>$LOGFILE

# Add current user to the Docker group
usermod -aG docker $SUDO_USER
echo "User $SUDO_USER added to the Docker group."

# Final message
echo -e $G "Docker installation completed successfully. Please log out and log back in for changes to take effect." $N
