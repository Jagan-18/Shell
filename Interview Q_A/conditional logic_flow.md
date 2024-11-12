write a simple script that calls with "Foo" prints "bar" and when called with "bar" print "foo" every other option should print "Try again"?


```
#!/bin/bash

if [ "$1" == "Foo" ]; then        # Check if first argument is "Foo"
  echo "bar"                      # If true, print "bar"
elif [ "$1" == "bar" ]; then      # Check if first argument is "bar"
  echo "foo"                      # If true, print "foo"
else                              # If neither condition is true
  echo "Try again"                # Print "Try again"
fi


```
### Explanation of the simplified version:
#### 1. $1: The first argument passed to the script.
#### 2. if: Checks if $1 equals "Foo". If true, prints "bar".
#### 3. elif: If $1 isn't "Foo", it checks if $1 equals "bar". If true, prints "foo".
#### 4. else: If neither condition matches, it prints "Try again".


### ex2

```
#!/bin/bash

case "$1" in
  Foo) echo "bar" ;;
  bar) echo "foo" ;;
  *)   echo "Try again" ;;
esac

```

## Explanation of the simplified version:
#### 1. case "$1" in: This starts a case block, which is another way to handle multiple conditions.
#### 2. Foo) echo "bar" ;;: If the argument ($1) is "Foo", it prints "bar".
#### 3. bar) echo "foo" ;;: If the argument ($1) is "bar", it prints "foo".
#### 4. *) echo "Try again" ;;: If the argument is anything else, it prints "Try again". The * is a wildcard that matches anything not explicitly listed before it.
