## Shell Scripting - Hello World

### Objectives

1. Define a variable with the string 'Hello World'
2. Print the value of the variable you've defined and redirect the output to the file "amazing_output.txt"

### Solution

```
#!/usr/bin/env bash

# Define the variable
message="Hello World"
# Print the value of the variable to the file
echo $message > amazing_output.txt
```
#### echo $message > amazing_output.txt: This prints the value of the message variable to the file amazing_output.txt. The > operator redirects the output to the file.