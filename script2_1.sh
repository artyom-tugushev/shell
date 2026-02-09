#!/usr/bin/env bash

# check is user administrator

read -rp "username: " username
# > empty string fallback
# > no user found fallback

if groups "$username" | grep -qwE 'sudo|wheel'; then
    echo "'$username' is administrator."
else
    echo "'$username' is NOT administrator."
fi