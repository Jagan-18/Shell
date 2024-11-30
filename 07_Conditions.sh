#!/bin/bash
NUMBER=$1

if [ $NUMBER -gt 100 ]; then
    echo "Give number $NUMBER is Greater than 100"
else
    echo "Give number $NUMBER is Not Greater than 100"
fi

#_____________________________________________________#
# ex:2
#!/bin/bash

ls -ltr # it is failure so it will not excute further

if [ $? -ne 0 ]; then
    echo "previous command is failure"
    exit 1
fi

ls -ltr

if [ $? -ne 0 ]; then
    echo "previous command is failure"
    exit 1
fi

echo "program is success"
