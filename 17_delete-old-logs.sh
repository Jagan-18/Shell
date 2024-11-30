#!/bin/bash

directory=/home/centos/logs
DATE=$(date +%F)
LOG_FILE="$DATE.log"

# Find all log files older than 14 days
INPUT=$(find $directory -name "*.log" -type f -mtime +14)

# Loop through the files and delete them
while IFS= read line; do
    echo "Deleting log file: $line" &>>$LOG_FILE

    rm -rf $line # Delete the file
done <<<"$INPUT"

### ------------------------------------------

### Delete old logs files
#### 1. we have a folder where we are storing log file : /tmp/shell-script-logs
#### 2. Delete log file more than 14 days, only ".log" extensions not anyother files.
#### 3. Hint: - Source -directory, -search .logfiles and more than 14 days ols, - rm -rf

#!/bin/bash

SOURCE_DIR="/tmp/shellscript-logs"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "$R Source Directory: $SOURCE_DIR does not exist.$N"
    exit 1
fi

# Find files older than 14 days with a .log extension
FILES_TO_DELETE=$(find "$SOURCE_DIR" -type f -mtime +14 -name "*.log")

# Check if there are files to delete
if [ -z "$FILES_TO_DELETE" ]; then
    echo -e "$G No log files older than 14 days found in $SOURCE_DIR.$N"
    exit 0
fi

# Loop through each file found and delete it
while IFS= read -r line; do
    echo -e "$Y Deleting file: $line $N"
    rm "$line"
done <<<"$FILES_TO_DELETE"
