## Write a script that reads a text file and counts the occurrences of each word, displaying the top 5 most frequent words along with their counts.

#!/bin/bash

# File to read
file_name="your_file.txt"

# Check if the file exists
if [ ! -f "$file_name" ]; then
    echo "File '$file_name' not found."
    exit 1
fi

# Read the file, normalize text to lowercase, remove punctuation, and count occurrences
word_count=$(tr -s '[:space:]' '\n' <"$file_name" | tr -d '[:punct:]' | tr '[:upper:]' '[:lower:]' | grep -v '^$' | sort | uniq -c | sort -nr)

# Display the top 5 most frequent words
echo "Top 5 Most Frequent Words:"
echo "$word_count" | head -n 5 | awk '{print $2 " - " $1 " occurrences"}'

## Explanation:
#### 1. tr -s '[:space:]' '\n': This converts multiple spaces or newlines to a single newline, ensuring each word is on its own line.
#### 2. tr -d '[:punct:]': This removes punctuation from the text, which is important for counting words correctly (e.g., "word." should be treated as "word").
#### 3. tr '[:upper:]' '[:lower:]': Converts all uppercase characters to lowercase, ensuring case-insensitive word counting.
#### 4. grep -v '^$': This removes any empty lines that could appear as a result of the tr commands.
#### 5. sort | uniq -c | sort -nr: First, it sorts the words alphabetically, then counts occurrences, and finally sorts them in descending order by frequency.
#### 6. head -n 5: Limits the output to the top 5 most frequent words.
#### 7. awk '{print $2 " - " $1 " occurrences"}': Formats the output to make it more readable, showing the word followed by its count.

### Example Output: If you run the script on a file that contains the following text
#### "Hello world! This is a test. Hello again, world!"

#### The output might look like:
#### - Top 5 Most Frequent Words:
#### - hello - 2 occurrences
#### - world - 2 occurrences
####  - is - 1 occurrences
####  - a - 1 occurrences
####  - test - 1 occurrences
