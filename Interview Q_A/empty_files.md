## Empty Files

### Objectives

1. Write a script to remove all the empty files in a given directory (including nested directories)

### Solution

```
#! /bin/bash
for x in *
do
    if [ -s $x ]
    then
        continue
    else
        rm -rf $x
    fi
done
```
## simple shell script that removes all empty files in a given directory, including any nested directories:

```
#!/bin/bash

# Function to remove empty files
remove_empty_files() {
    # Iterate through all files and directories recursively
    find "$1" -type f -empty -exec rm -f {} \;
}

# Check if directory is provided as argument
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Check if the directory exists
if [ ! -d "$1" ]; then
    echo "Directory $1 does not exist."
    exit 1
fi

# Call the function to remove empty files
remove_empty_files "$1"
echo "All empty files in $1 and its subdirectories have been removed."
```

### How the above script works:
### 1. find: The find command is used to search for files. We use the -type f option to search for regular files, and the -empty option to find files that are empty.
### 2. -exec rm -f {} ;: This part removes each empty file found by find.
### 3. Check for directory: The script checks if a directory argument is provided and if the directory exists before proceeding.


## _________________________________________________________________________________________________________________________________________________________________#
### another approach using a slightly different method with a for loop and the find command for recursive searching. This version avoids using -exec directly and uses rm with a simpler loop:
```
#!/bin/bash

# Function to remove empty files
remove_empty_files() {
    # Find all files in the directory and loop through them
    for file in $(find "$1" -type f); do
        # Check if the file is empty
        if [ ! -s "$file" ]; then
            rm "$file"
            echo "Removed empty file: $file"
        fi
    done
}

# Check if a directory argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Check if the provided argument is a valid directory
if [ ! -d "$1" ]; then
    echo "Directory $1 does not exist."
    exit 1
fi

# Call the function to remove empty files
remove_empty_files "$1"

```
### Key Differences:
### 1. For Loop: Instead of using find with -exec, we explicitly loop over the files found using find "$1" -type f.
### 2. File Size Check: Inside the loop, we check if the file size is 0 (empty) using the -s test. If the file size is non-zero, -s returns true, so we negate it with ! -s to check for empty files.
### 3. rm: We directly call rm within the loop to remove empty files.