Conditions
Conditions are used to take a decision. Usually we use if. A general syntax is
```
if [ condition ]
then
    # These statements run if the condition is true
else
    # These statements run if the condition is false
fi

```
### Key points:
1. The [ (or test) command evaluates the condition inside it.
2. The then block is executed if the condition is true.
3. The else block is executed if the condition is false.
4. The fi keyword ends the if statement.

#### Example:
#!/bin/bash

x=5

if [ $x -gt 3 ]; then
    echo "x is greater than 3"
else
    echo "x is not greater than 3"
fi

### Exit Status : In Linux and UNIX-like systems, commands return an exit status (also known as return code or exit code) that indicates the success or failure of the command. This exit status is stored in a special variable called $?.

## Exit Status 0: Indicates success.
## Exit Status 1-127: Indicates failure (the specific number depends on the type of error).
## Exit Status 128+: Indicates a command was terminated by a signal (e.g., exit status 137 could indicate a command was terminated due to a SIGKILL signal).

#!/bin/bash

echo "This is a test"

if [ $? -eq 0 ]; then
    echo "The previous command was successful"
else
    echo "The previous command failed"
fi


### EX:1
#!/bin/bash

# Trying to create a directory
mkdir /tmp/some_directory

# Check if the mkdir command was successful
if [ $? -eq 0 ]; then
    echo "Directory was created successfully."
else
    echo "Failed to create directory."
fi


### EX:2 Alternatively, you can use the command directly in the if condition:
#!/bin/bash

# Try creating a directory
if mkdir /tmp/some_directory; then
    echo "Directory was created successfully."
else
    echo "Failed to create directory."
fi
