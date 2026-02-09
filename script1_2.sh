#!/usr/bin/env bash

# create file with custom rights

read -rp "filename: " filename

if [ -z "$filename" ]
then
    echo "filename cannot be empty"
    exit 1
fi

read -rp "File permissions in 000 format: " perms

if ! [[ "$perms" =~ ^[0-7]{3}$ ]]
then
    echo "File permissions should be in 000 format"
    exit 2
fi

if ! touch "$filename"
then
    echo "Error: failed to create file '$filename'" >&2
    exit 3
fi

if chmod "$perms" "$filename"
then
    echo "Success: file '$filename' created with permissions $perms"
else
    echo "Error: failed to set permissions '$perms' on '$filename'" >&2
    exit 4
fi