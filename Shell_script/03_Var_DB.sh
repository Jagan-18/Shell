### User want to connect Data base by useing UserName/Password

#!/bin/bash

echo "Please enter your Username: "

read -s USERNAME #The value enterend above will be automatically atteched to USERNAME

echo "Please enter your password: "

read -s PASSWORD

echo "Username is: $USERNAME, Password is: $PASSWORD" # I am printing just for validateion, you should not print username anpassword in scripts.
