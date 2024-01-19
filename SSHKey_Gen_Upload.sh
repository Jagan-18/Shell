#!/bin/bash
#title       : SSHKeyGenandUpload
#Description : Automation SSH-key gent and upload
#Data        :
#Version     : V1.0
#Usage       : Sh s.sh
#CopyRights  : Jagadeesh
#Contact     : ########

echo "Enter your GitHub Personal Access Token: "
read token
#echo $token > token.txt
#cat token.txt

cat ~/.ssh/id_rsa.pub
# if condition to validate weather ssh keys are already present or not
if [ $? -eq 0]
then
    echo "SSH Keys are already present...."
else
     echo "SSH keys are not present ....., Create the sshKeys using ssh-keygen command"
ssh-keygen -t rsa
echo "SSH keys successfully generated"
fi

sshkey=`cat ~/.ssh/id_rsa.pub`

if [ $? -eq 0 ]
then 
   echo "Copying the key t0 Github account"
curl -X POST -H "content-type: application/json" -d "{\"title\": \"SSHKEY\",\"key\": \"$sshkey\"}" "https://api.github.com/user/keys?access_token=$token"
if [ $? -eq 0]
then
    echo "Succeddfully copied the token to Github"
exit 0
else
echo "failed"
exit 1
fi
else
    echo "Failure in Generating the key"
exit 1
fi







