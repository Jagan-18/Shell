## Basic Date

### Objectives

1. Write a script that will put the current date in a file called "the_date.txt"

### Solution

```
#!/bin/bash

# Output the current date and time to the file 'the_date.txt'
echo $(date) > the_date.txt
echo $(date) "+%Y-%m-%d %H:%M:%S" > the_date.txt
```
