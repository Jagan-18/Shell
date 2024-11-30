#!/bin/bash

#df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6 " " $1}'
#df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6}' | cut -d "%" -f1

DISK_THRESHOLD=1
DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $6 " " $1}')
message=""

while IFS= read line; do
    usage=$(echo $line | cut -d "%" -f1)
    partition=$(echo $DISK_USAGE | cut -d " " -f2)
    echo "usage: $usage"
    echo "partition: $partition"
    if [ $usage -ge $DISK_THRESHOLD ]; then
        message+="High Disk usage on $partition: $usage%\n"
    fi
done <<<"$DISK_USAGE"

echo "message: $message"

echo -e "$message" | mail -s "High Disk Usage" info@joindevops.com

#disk,memory,cpu --> any of this or all

##___________________________________________________________________________________________##
## Create a script to monitor the disk usage of a server. If usage exceeds 80%, log the details to a file and send an alert email
###EX:1
#!/bin/bash

# Set threshold for disk usage percentage
DISK_THRESHOLD=80
LOG_FILE="/var/log/disk_usage.log"
EMAIL_RECIPIENT="info@joindevops.com"

# Get disk usage details
DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem' | awk '{print $1 " " $6}' | tr -d '%')

# Initialize message variable
message=""

# Loop through the disk usage information
while IFS= read -r line; do
    partition=$(echo "$line" | awk '{print $1}')
    usage=$(echo "$line" | awk '{print $2}')

    # Check if usage exceeds the threshold
    if [ "$usage" -ge "$DISK_THRESHOLD" ]; then
        message+="High Disk usage on partition $partition: $usage%\n"

        # Log to file
        echo "$(date) - High Disk usage on $partition: $usage%" >>"$LOG_FILE"
    fi
done <<<"$DISK_USAGE"

# If there are any alerts, send an email
if [ -n "$message" ]; then
    echo -e "$message" | mail -s "High Disk Usage Alert" "$EMAIL_RECIPIENT"
fi

#___________________________________________________________________________________________________________#
###EX:2
#!/bin/bash

# Set the disk usage threshold (80%)
DISK_THRESHOLD=80
LOG_FILE="/var/log/disk_usage.log"
EMAIL_RECIPIENT="info@joindevops.com"

# Check disk usage (ignore tmpfs filesystems)
df -hT | grep -vE 'tmpfs|Filesystem' | while read line; do
    # Extract partition name and disk usage percentage
    partition=$(echo "$line" | awk '{print $1}')
    usage=$(echo "$line" | awk '{print $6}' | sed 's/%//')

    # If usage exceeds threshold, log and send an email
    if [ "$usage" -ge "$DISK_THRESHOLD" ]; then
        # Log the high usage to the log file
        echo "$(date) - High Disk usage on $partition: $usage%" >>"$LOG_FILE"

        # Send an email alert
        echo "High Disk usage on $partition: $usage%" | mail -s "High Disk Usage Alert" "$EMAIL_RECIPIENT"
    fi
done
