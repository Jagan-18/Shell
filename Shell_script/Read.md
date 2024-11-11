




### Conditions:

1. Use if, elif, else, and case for conditional logic.
2. Use -gt, -lt, -eq, etc., for numeric comparisons.
3. Use -e to check for file existence.


Ex: 

if (today != "Sunday")
then
 
  echo "Goto school"

else

   echo "today is holiday,Happy sunday"

fi


### Example 1: Using if Statements

'''
#!/bin/bash

echo "Enter a number:"
read number

if [ "$number" -gt 10 ]; then
    echo "The number is greater than 10."
elif [ "$number" -eq 10 ]; then
    echo "The number is equal to 10."
else
    echo "The number is less than 10."
fi

'''
### Example 2: Using case Statements
'''
#!/bin/bash

echo "Enter a fruit name:"
read fruit

case $fruit in
    apple)
        echo "You chose an apple."
        ;;
    banana)
        echo "You chose a banana."
        ;;
    cherry)
        echo "You chose a cherry."
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac

'''

### Example 3: Checking File Existence
'''
#!/bin/bash

echo "Enter the file name:"
read filename

if [ -e "$filename" ]; then
    echo "The file exists."
else
    echo "The file does not exist."
fi

'''


In shell scripting, there are several special variables that you can use to interact with the script's execution environment. Here's a quick overview of the ones you've mentioned, along with a few additional ones:

# $?: Exit status of the last command executed. A value of 0 usually means success, while any non-zero value indicates an error.

# $0: The name of the script itself.
 
# $1, $2, ..., $n: Positional parameters that represent the arguments passed to the script. $1 is the first argument, $2 is the second, and so on.

# $#: The number of positional parameters passed to the script. It tells you how many arguments were provided.

# $@: All the positional parameters as separate quoted strings. It’s useful for looping over arguments.

# $*: All the positional parameters as a single word. If you quote it ("$*"), it treats all arguments as a single string.

# $$: The process ID (PID) of the currently executing script.

# $!: The process ID of the last background command executed.

# $-: The current options set for the shell.

# $USER: The name of the user currently executing the script.

# $HOME: The home directory of the current user.

# $RANDOM: Generates a random number each time it is referenced.