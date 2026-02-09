#!/usr/bin/env bash

# give access to John Doe

read -rp "name: " name
# > empty string fallback

read -rp "surname: " surname
# > empty string fallback

full_name="'$name' '$surname'"

if [ "$full_name" == "John Doe" ]; then
    echo 'Access granted'
    exit 0
else
    echo "Access Denied"
fi