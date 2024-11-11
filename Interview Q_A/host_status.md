## It's Alive!

### Objectives

1. Write a script to determine whether a given host is down or up

### Solution

```
#!/usr/bin/env bash
SERVERIP=<IP Address>
NOTIFYEMAIL=test@example.com

ping -c 3 $SERVERIP > /dev/null 2>&1
if [ $? -ne 0 ]
then
   # Use mailer here:
   mailx -s "Server $SERVERIP is down" -t "$NOTIFYEMAIL" < /dev/null
fi
```

## Explanation:
#### SERVERIP: A variable that holds the IP address of the server you want to monitor. Replace <IP Address> with the actual IP address you want to check (e.g., 192.168.1.1).
#### NOTIFYEMAIL: A variable that holds the email address where the notification will be sent if the server is unreachable. SSReplace test@example.com with the actual email address (e.g., admin@mydomain.com).
#### ping -c 3 $SERVERIP: Sends 3 ICMP Echo Request packets to the server at $SERVERIP.
#### > /dev/null 2>&1: Redirects both standard output (stdout) and standard error (stderr) to /dev/null, discarding any output from the ping command.
#### mailx: This is the command used to send an email.
#### 1. -s "Server $SERVERIP is down": Specifies the subject of the email. The $SERVERIP variable will be replaced with the IP address of the server, so the subject will say "Server [IP Address] is down".
#### 2. -t "$NOTIFYEMAIL": Specifies the recipient email address. The $NOTIFYEMAIL variable will be replaced with the email address you want to send the notification to.
#### 3. < /dev/null: This redirects an empty input to mailx, meaning the email body will be empty (you could add a custom message if desired).


#-----------------------------------------------------------------------------------------------------------------------------------------------------#
```
#!/usr/bin/env bash

SERVERIP="<IP Address>"  # Replace with the actual IP address
NOTIFYEMAIL="test@example.com"

# Ping server and send email if down
if ! ping -c 3 "$SERVERIP" > /dev/null 2>&1; then
    echo "Server $SERVERIP is down" | mailx -s "Server $SERVERIP is down" "$NOTIFYEMAIL"
fi

```

#----------------------------------------------------------------------------------------------# 
```
#!/bin/bash

# Check if an argument (host) is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <hostname or IP>"
  exit 1
fi

# The host to check
HOST=$1

# Ping the host once and check the response
ping -c 1 $HOST &> /dev/null

# Check the exit status of the ping command
if [ $? -eq 0 ]; then
  echo "$HOST is UP."
else
  echo "$HOST is DOWN."
fi

```
#### Explanation:
#### 1. The script checks if a hostname or IP address is passed as an argument.
#### 2. It uses the ping command with the -c 1 option to send just one packet.
#### 3. &> /dev/null redirects both stdout and stderr to /dev/null, so it doesn't clutter the terminal with unnecessary output.
#### 4. The script then checks the exit status ($?) of the ping command:
#### -  If it's 0, the host is up.
#### - If it's non-zero, the host is down.