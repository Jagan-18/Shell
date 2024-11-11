## Number of Arguments

### Objectives

* Write a script that will print "Got it: <argument value>" in case of one argument
* In case no arguments were provided, it will print "Usage: ./<program name> <argument>"
* In case of more than one argument, print "hey hey...too many!"

### Solution

```
#!/usr/bin/env bash

set -eu

main() {
  case $# in
    0) printf "%s" "Usage: ./<program name> <argument>"; return 1 ;;
    1) printf "%s" "Got it: $1"; return 0 ;;
    *) return 1 ;;
  esac
}

main "$@"
```

#### Explanation:
#### 1. set -eu: Ensures the script exits on errors or if an unset variable is used.
#### 2. Argument Handling: The case statement checks the number of arguments ($#):
####  - 0: No arguments → prints usage and exits with status 1.
####  - 1: One argument → prints "Got it: <argument>" and exits with status 0.
####  - *: More than one argument → exits with status 1.
#_________________________________________________________________________#
```
#!/bin/bash

# Check the number of arguments
if [ $# -eq 0 ]; then
  echo "Usage: ./$0 <argument>"
elif [ $# -eq 1 ]; then
  echo "Got it: $1"
else
  echo "hey hey...too many!"
fi

```

#### Explanation:
#### 1. #!/bin/bash: This shebang line tells the system to use the Bash shell to interpret the script.
#### 2. if [ $# -eq 0 ]: This checks if the number of arguments ($#) is 0 (i.e., no arguments were provided).
#### 3. elif [ $# -eq 1 ]: If there's exactly one argument, it will print the message Got it: <argument value>, using $1 to access the first argument.
#### 4. else: If there are more than one argument, it will print hey hey...too many!.



#_______________________________________________#
#### Here's another alternative using a while loop with a shift to handle arguments. 
```
#!/usr/bin/env bash
set -eu

args=("$@")

# Process based on the number of arguments
while [ ${#args[@]} -gt 0 ]; do
  case ${#args[@]} in
    0) echo "Usage: ./$0 <argument>"; exit 1 ;;
    1) echo "Got it: ${args[0]}"; exit 0 ;;
    *) exit 1 ;;
  esac
done
```
#### Explanation:
#### 1. set -eu: Ensures the script stops on errors and on the use of unset variables.
#### 2. args=("$@"): Copies all the arguments into an array called args.
#### 3. while loop: Although the loop is only run once, it processes the arguments array:
####  - If no arguments (${#args[@]} is 0): It prints the usage message and exits with status 1.
####  - If exactly one argument (${#args[@]} is 1): It prints "Got it: <argument>" and exits with status 0.
####  - If more than one argument (${#args[@]} is greater than 1): It exits with status 1.
