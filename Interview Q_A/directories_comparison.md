## Directories Comparison

### Objectives

1. You are given two directories as arguments and the output should be any difference between the two directories

### Solution 1

Suppose the name of the bash script is ```dirdiff.sh```

```
#!/bin/bash

if test $# -ne 2
then
	echo -e "USAGE: ./dirdiff.sh directory1 directory2"
	exit 1
fi

# check for the checksums. 
# If both the checksums same, then both directories are same
if test `ls -1 $1 | sort | md5sum | awk -F "  " '{print $1}'` == `ls -1 $2 | sort | md5sum | awk -F "  " '{print $1}'`
then
	echo -e "No difference between the 2 directories"
	exit 0
fi

diff -q $1 $2
```

### Solution 2

With gnu find, you can use diff to compare directories recursively.

```shell
diff --recursive directory1 directory2
```




### Solution:2
```
#!/bin/bash

# Check if exactly two arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <directory1> <directory2>"
  exit 1
fi

dir1="$1"
dir2="$2"

# Check if both directories exist
if [ ! -d "$dir1" ]; then
  echo "Error: Directory '$dir1' does not exist."
  exit 1
fi

if [ ! -d "$dir2" ]; then
  echo "Error: Directory '$dir2' does not exist."
  exit 1
fi

# Compare the contents of the directories using diff
echo "Comparing directories '$dir1' and '$dir2'..."

# List and compare files in both directories
echo -e "\nDifferences in files and subdirectories:"
diff -qr "$dir1" "$dir2"

# Optionally, you can use rsync to see what would be copied between the directories
# Uncomment the next line to use rsync for a more detailed comparison:
# rsync -avun "$dir1"/ "$dir2"/

exit 0

```

#### Explanation:
#### 1. Argument check: The script checks if exactly two arguments (directories) are provided.
#### 2. Directory existence check: It checks whether both directories exist.
#### 3. diff -qr: The diff command with the -q (quick) and -r (recursive) options compares the contents of the directories and #### 4. reports any differences. It will list any files that are different, missing, or present only in one directory.
#### 5. Optional rsync: If you want a more detailed view of the differences (e.g., file permissions, sizes, timestamps), you can uncomment the rsync command at the end. The -avun options of rsync simulate the file synchronization process without making any changes, showing a detailed report of what would be copied or updated.