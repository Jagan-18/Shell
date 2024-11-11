## Argument Check

### Objectives

Note: assume the script is executed with an argument

1. Write a script that will check if a given argument is the string "pizza"
2. If it's the string "pizza" print "with pineapple?"
3. If it's not the string "pizza" print "I want pizza!"

### Solution

```
#!/usr/bin/bash

[[ ${1} == "pizza" ]] && echo "with pineapple?" || echo "I want pizza!"
```

### Ans:2
```
#!/usr/bin/bash

if [[ ${1} == "pizza" ]]; then
    echo "with pineapple?"
else
    echo "I want pizza!"
fi
```