#!/bin/bash
file=/etc/passwd

# Color codes for output
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo -e "$R""Source file: $file does not exist."$N
    exit 1
fi

# Read the file line by line
while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path; do
    # Output user information with color formatting
    echo -e "$G""Username: $username"$N
    echo -e "$Y""User_ID: $user_id"$N
    echo -e "$Y""User Full Name: $user_fullname"$N
    echo -e "$G""Home Directory: $home_dir"$N
    echo -e "$R""Shell: $shell_path"$N
    echo "-----------------------" # Add a separator line for clarity
done <"$file"

### Explanation of Changes:
#### 1. File existence check: Now it exits the script with exit 1 after printing an error message if the file /etc/passwd doesn't exist.
#### 2. while loop: The loop reads each line from /etc/passwd and splits the line using the colon (:) delimiter into the variables username, password, user_id, group_id, user_fullname, home_dir, and shell_path.
#### 3. Colorized output: The output of each user's information is now color-coded for better visibility.
#### 4. Read file with redirection (<): The < "$file" at the end of the while loop ensures the file is passed to the loop for reading.

## Notes:
### 1.The script assumes the /etc/passwd file exists and is readable.
### 2. It uses color codes to enhance the visual output for each user detail. You can adjust the colors based on preference.
