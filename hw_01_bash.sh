#!/bin/bash 

# Title: Create scenario to change the owner of files and folders
# Parameters: 
# $1 <username>
# $2 <directory>

# Requirements:
# $1 - should be existing user in your OS (in your script the checking block should be present)
# $2 - should be only the directory (also need to be checked in your script)

username=$1 
directory=$2

if [ -z $username ] && [ -z $directory ];
then
    echo 'Please provide two arguments: user & directory'
    exit
fi


if id $username &>/dev/null; 
then
    echo 'User '$username' found '
else
    echo "No user with the name $username"
    exit
fi


if [ -d $directory ];
then
    echo "Found directory $directory"
else
    echo 'No '$directory' in directory tree or not a directory'
    exit
fi


echo `sudo chown -R $username:$username $directory`
echo "Owner of the $directory changed to $username"