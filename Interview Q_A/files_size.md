## Files Size

### Objectives

1. Print the name and size of every file and directory in current path

Note: use at least one for loop!

### Solution

```
#!/usr/bin/env bash

for i in $(ls -S1); do
    echo $i: $(du -sh "$i" | cut -f1)
done 
```
#### Explanation above code:
#### 1. #!/usr/bin/env bash is a common practice for portability, ensuring the script runs with the bash shell regardless of its location on the system
#### 2. ls -S1: Lists files/directories, sorted by size (largest first), one per line.
#### 3. for i in $(...): Loops through each file/directory from the ls output.
#### 4. du -sh "$i" | cut -f1: Shows the size of the file/directory in human-readable format (e.g., 10M), and cut -f1 extracts only the size (not the name).
#### 5. echo $i: ...: Prints the file name followed by its size.

#________________________________________________________________________________________________________________________________________________________#

###  If you want the output to be sorted by size, you can pipe the output through sort:

```
#!/usr/bin/env bash

# Loop through all items in the current directory (including hidden files)
for i in * .*; do
    # Ensure we only process files or directories that exist
    if [ -e "$i" ]; then
        # Use du for directories and files
        echo "$i: $(du -sh "$i" | cut -f1)"
    fi
done | sort -h

```
#### sort -h sorts the sizes in human-readable format (e.g., 1K, 200M, 2G) properly.
### Changes and explanations:
#### 1. Handling Hidden Files: The for i in * .*; loop includes hidden files and directories (those starting with a dot).
#### 2. Check for Existence: if [ -e "$i" ]; ensures that you are processing actual files or directories and not unintended results from wildcard expansion.
#### 3. Quoting Filenames: Double quotes around $i handle filenames with spaces or special characters safely.
#### 4. Sorting by Size: The du -sh command is used to display human-readable sizes, and this method will work for both files and directories.


### ------------------------------------------------------------------------------------------------------------------------------------------
## shell script that prints the name and size of every file and directory in the current path using a for loop:
```
#!/bin/bash

# Loop through all files and directories in the current path
for item in *; do
    # Check if it's a file or a directory
    if [ -f "$item" ]; then
        # Print the file name and its size
        size=$(stat -c %s "$item")
        echo "File: $item, Size: $size bytes"
    elif [ -d "$item" ]; then
        # Print the directory name and its size
        size=$(du -sh "$item" | cut -f1)
        echo "Directory: $item, Size: $size"
    fi
done

```
#### Explanation:
#### 1.  The for item in *; do loop iterates over all files and directories in the current directory.
#### 2   -f "$item" checks if the item is a regular file.
#### 3.  -d "$item" checks if the item is a directory.
#### 4.  For files, stat -c %s is used to retrieve the file size in bytes.
#### 5.  For directories, du -sh calculates the human-readable size, and cut -f1 is used to extract just the size value.