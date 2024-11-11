### logging functionality to your script to capture the output of the installation process as well as any errors.
#!/bin/bash

# Log file location
LOGFILE="/var/log/install_script.log"

# Function to log messages
LOG() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') :: $1" | tee -a "$LOGFILE"
}

ID=$(id -u)

VALIDATE() {
    if [ $1 -ne 0 ]; then
        LOG "ERROR :: $2 ...FAILED"
        exit 1
    else
        LOG "$2 ....Success"
    fi
}

if [ $ID -ne 0 ]; then
    LOG "ERROR :: Please run this script with root access"
    exit 1
else
    LOG "You are running as the root user"
fi

# Install MySQL
yum install mysql -y &>>"$LOGFILE"
VALIDATE $? "Installing MySQL"

# Install Git
yum install git -y &>>"$LOGFILE"
VALIDATE $? "Installing Git"

LOG "Installation script completed."

#__________________________________________________#

###Shell Script to Install MySQL and Git with Colored Logging
#!/bin/bash

# Define log file
LOG_FILE="/var/log/install_script.log"

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Function to log messages with color
log_message() {
    echo -e "$(date +'%Y-%m-%d %H:%M:%S') - ${1}${NC}" >>"$LOG_FILE"
    echo -e "$(date +'%Y-%m-%d %H:%M:%S') - ${1}"
}

# Update package list
log_message "${YELLOW}Updating package list...${NC}"
sudo apt update >>"$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "${RED}Failed to update package list.${NC}"
    exit 1
fi
log_message "${GREEN}Package list updated.${NC}"

# Install Git
log_message "${YELLOW}Installing Git...${NC}"
sudo apt install git -y >>"$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "${RED}Failed to install Git.${NC}"
    exit 1
fi
log_message "${GREEN}Git installed successfully.${NC}"

# Install MySQL
log_message "${YELLOW}Installing MySQL...${NC}"
sudo apt install mysql-server -y >>"$LOG_FILE" 2>&1
if [ $? -ne 0 ]; then
    log_message "${RED}Failed to install MySQL.${NC}"
    exit 1
fi
log_message "${GREEN}MySQL installed successfully.${NC}"

# Secure MySQL installation
log_message "${YELLOW}Securing MySQL installation...${NC}"
sudo mysql_secure_installation >>"$LOG_FILE" 2>&1
log_message "${GREEN}MySQL installation secured.${NC}"

# Finish
log_message "${GREEN}Installation script completed successfully.${NC}"
echo "Installation completed. Check $LOG_FILE for details."
