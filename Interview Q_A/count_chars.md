## count_characters

### Objectives

1. Read input from the user until you get empty string
2. For each of the lines you read, count the number of characters and print it

### Constraints

1. You must use a while loop
2. Assume at least three lines of input

### Solution

```
#!/usr/bin/env bash

echo -n "Please insert your input: "

while read line; do
    echo -n "$line" | wc -c
    echo -n "Please insert your input: "
done
```

### Solution2:

```
#!/usr/bin/env bash

# Read input from the user until an empty string is entered
while true; do
    # Read a line of input
    read -p "Enter a line: " line
    
    # Check if the input is empty (break the loop if empty)
    if [ -z "$line" ]; then
        break
    fi
    
    # Count the number of characters in the line and print it
    length=${#line}
    echo "Number of characters: $length"
done

```


### Explanation:
1. #!/usr/bin/env bash: The shebang to use the Bash shell.
2. while true; do ... done: This creates an infinite loop, which continues until explicitly broken.
3. read -p "Enter a line: " line: This reads a line of input from the user and stores it in the variable line.
4. if [ -z "$line" ]; then break; fi: This checks if the line is empty (-z checks for zero length). If the input is empty, the 5. loop breaks, ending the input process.
6. ${#line}: This is the syntax to count the number of characters in the string stored in line.
7. echo "Number of characters: $length": This prints the length of the current input line.

