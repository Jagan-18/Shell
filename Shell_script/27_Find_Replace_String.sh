### You need to find and replace a specific string in multiple text files in a directory. How would you use shell script accomplish this task?

#!/bin/bash

# Define the strings
OLD_STRING="old_string"
NEW_STRING="new_string"

# Step 1: Find files containing the string 'old_string' and process them directly
grep -rl "$OLD_STRING" /path/to/directory | while IFS= read -r file; do
    # Use sed to replace 'old_string' with 'new_string' in the identified files
    # We escape '/' by using a different delimiter (e.g., '#')
    sed -i "s/$OLD_STRING/$NEW_STRING/g" "$file"
    echo "Processed: $file"
done >>filelist.txt

## Point-by-Point Explanation:
### Define Variables:
#### - OLD_STRING="old_string": The string to be replaced.
#### - NEW_STRING="new_string": The replacement string.
### Search for Files: grep -rl "$OLD_STRING" /path/to/directory: Finds files containing OLD_STRING.
### Loop through Files: while IFS= read -r file; do ... done: Iterates through each file found by grep.
#### Replace Text in Files: sed -i "s#$OLD_STRING#$NEW_STRING#g" "$file": Replaces OLD_STRING with NEW_STRING in each file.
### Log Processed Files: echo "Processed: $file": Prints the name of each processed file.

### Same Example:
: $(
    #!/bin/bash

    # Define the directory and the strings
    DIRECTORY="/path/to/directory"
    SEARCH_STRING="old_text"
    REPLACE_STRING="new_text"

    # Find all text files and apply the replacement
    find "$DIRECTORY" -type f -name "*.txt" | while read -r file; do
        # Use sed to replace 'old_text' with 'new_text' in the file
        sed -i "s/$SEARCH_STRING/$REPLACE_STRING/g" "$file"
        echo "Processed: $file"
    done

)
