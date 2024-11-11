## Great Day

### Objectives

1. Write a script that will print "Today is a great day!" unless it's given a day name and then it should print "Today is <given day>"

Note: no need to check whether the given argument is actually a valid day

### Solution

```
#!/usr/bin/env bash

echo "Today is ${1:-a great day!}"
```
### Explanation:
#### 1. This script uses parameter expansion in Bash (${1:-a great day!}).
#### 2. If $1 (the first argument) is provided, it will use that value.
#### 3. If $1 is not provided (i.e., it's empty), it defaults to the string "a great day!".

```
#!/bin/bash

if [ -z "$1" ]; then
  echo "Today is a great day!"
else
  echo "Today is $1"
fi

```
#### Explanation:
#### 1. The script checks if an argument ($1) is provided (i.e., if the first positional parameter is empty).
#### 2. If no argument is given, it prints "Today is a great day!".
#### 3. If an argument (such as a day name) is provided, it prints "Today is <given day>".
