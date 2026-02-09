#!/usr/bin/env bash

# get user shell

read -rp "username: " username

if [[ -z "$username" ]]; then
    echo "username cannot be empty"
    exit 1
fi

shell=$(grep "^$username:" /etc/passwd | cut -d: -f7)

if [[ -n "$shell" ]]; then
    echo "$shell"
else
    echo "User '$username' not found"
    exit 2
fi