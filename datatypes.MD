Data Types
There is no importance to data types in shell scripting. However we can have dataypes. By default shell consider the values as string format i.e text.

But we can do arithmetic operations, shell can intelligently convert text to number if it is really number.

We can have array in shell script. Elements starts from index 0.

#!/bin/bash

# Define an array of fruits
FRUITS=("Apple" "Orange" "Banana")

# Print all fruits using array expansion
echo "Fruits are: ${FRUITS[@]}"
