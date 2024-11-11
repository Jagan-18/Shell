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
