#!/usr/bin/env bash

# show all users from file

while read -r user; do
    [ -n "$user" ] && echo "Creating new user: useradd $user"
done < script4.txt