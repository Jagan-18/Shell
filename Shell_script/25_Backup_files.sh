## Develop a backup script that takes a source directory and a destination directory as input and creates a compressed archive (.tar.gz) of the source directory in the destination folder with a timestamp.
#_________________________________________#
### Same quation there will ask like this
####  Takes the source directory and the destination directory as inputs.
#### Generates a timestamped compressed backup (.tar.gz) of the source directory.
#### Saves this backup in the destination directory.

#!/bin/bash

# Ensure correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_directory> <destination_directory>"
    exit 1
fi

# Get the input arguments
SOURCE_DIR="$1"
DEST_DIR="$2"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 2
fi

# Check if the destination directory exists, create if it doesn't
if [ ! -d "$DEST_DIR" ]; then
    echo "Destination directory '$DEST_DIR' does not exist. Creating it."
    mkdir -p "$DEST_DIR"
fi

# Generate a timestamp for the backup file
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define the name of the backup archive (source directory name + timestamp)
ARCHIVE_NAME=$(basename "$SOURCE_DIR")_$TIMESTAMP.tar.gz

# Create the tar.gz archive
tar -czf "$DEST_DIR/$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Check if the tar command was successful
if [ $? -eq 0 ]; then
    echo "Backup successful! Archive created at '$DEST_DIR/$ARCHIVE_NAME'."
else
    echo "Error: Failed to create the backup archive."
    exit 3
fi


: '
### Here’s the explanation of each line of the script in simple text:

1. `#!/bin/bash`
   - Specifies the script should be run with the Bash shell.

2. `if [ "$#" -ne 2 ]; then`
   - Checks if the number of arguments passed to the script is not equal to 2.

3. `echo "Usage: $0 <source_directory> <destination_directory>"`
   - Prints the correct usage of the script if the argument count is incorrect.

4. `exit 1`
   - Exits the script with an error code `1` if the arguments are not correct.

5. `SOURCE_DIR="$1"`
   - Assigns the first argument passed to the script to the variable `SOURCE_DIR` (source directory).

6. `DEST_DIR="$2"`
   - Assigns the second argument passed to the script to the variable `DEST_DIR` (destination directory).

7. `if [ ! -d "$SOURCE_DIR" ]; then`
   - Checks if the source directory doesn't exist.

8. `echo "Error: Source directory '$SOURCE_DIR' does not exist."`
   - Prints an error message if the source directory doesn't exist.

9. `exit 2`
   - Exits the script with an error code `2` if the source directory doesn't exist.

10. `if [ ! -d "$DEST_DIR" ]; then`
    - Checks if the destination directory doesn't exist.

11. `echo "Destination directory '$DEST_DIR' does not exist. Creating it."`
    - Prints a message indicating that the destination directory is being created.

12. `mkdir -p "$DEST_DIR"`
    - Creates the destination directory if it doesn’t exist.

13. `TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")`
    - Creates a timestamp in the format `YYYY-MM-DD_HH-MM-SS` to make the archive filename unique.

14. `ARCHIVE_NAME=$(basename "$SOURCE_DIR")_$TIMESTAMP.tar.gz`
    - Creates the archive name by appending the timestamp to the base name of the source directory.

15. `tar -czf "$DEST_DIR/$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"`
    - Creates a compressed `.tar.gz` archive of the source directory and saves it to the destination directory with the timestamped name.

16. `if [ $? -eq 0 ]; then`
    - Checks if the `tar` command was successful (`$?` stores the exit status of the last command).

17. `echo "Backup successful! Archive created at '$DEST_DIR/$ARCHIVE_NAME'."`
    - Prints a success message if the backup was created successfully.

18. `else`
    - If the `tar` command failed, this block executes.

19. `echo "Error: Failed to create the backup archive."`
    - Prints an error message if the backup creation failed.

20. `exit 3`
    - Exits the script with error code `3` if the archive creation failed.

This concise breakdown describes what each line of the script does. Let me know if you need more details!

'