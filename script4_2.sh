#!/usr/bin/env bash

show_user_info() {
    echo "User: $1"
    echo "UID: $(id -u "$1")"
    echo "Home: $(getent passwd "$1" | cut -d: -f6)"
    echo "Groups: $(id -Gn "$1")"
}

create_user() {
    echo "Command: sudo useradd -m $1"
}

delete_user() {
    echo "Command: sudo userdel -r $1"
}

read -rp "Username: " name
# > empty string fallback
# > no user found fallback

PS3="Choose action (1-4): "
select opt in "Show info" "Create user" "Delete user" "Quit"; do
    case $opt in
        "Show info")     show_user_info "$name" ;;
        "Create user")   create_user "$name" ;;
        "Delete user")   delete_user "$name" ;;
    esac
done