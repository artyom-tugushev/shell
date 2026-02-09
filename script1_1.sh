#!/usr/bin/env bash

# show line with username from /etc/passwd

read -rp "username: " username

if [ -z "$username" ]
then
    echo "username cannot be empty"
    exit 1
fi

line=$(grep "^$username:" /etc/passwd)

if [ -n "$line" ]
then
    echo "$line"
else
    echo "'$username' is not in /etc/passwd"
    exit 2
fi