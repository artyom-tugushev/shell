#!/usr/bin/env bash

# change user's uid, groups or home directory

read -rp "username: " user
# > empty string fallback
# > no user found fallback

uid=$(id -u "$user")
home=$(getent passwd "$user" | cut -d: -f6)
groups=$(id -Gn "$user")

echo "Current info for '$user':"
echo "  UID:        $uid"
echo "  Home:       $home"
echo "  Groups:     $groups"
echo

read -rp "what to change:
[1] uid
[2] home
[3] groups
Enter number: " selection
# > not 1-3 fallback

echo "$selection"

if [ "$selection" == 1 ]; then
    read -rp "Enter new UID: " new_uid
    # > empty string fallback
    
    if getent passwd "$new_uid"; then
        echo "UID in use. Aborting."
        exit 1
    fi
    echo "sudo us ermod --uid $new_uid $user"
fi

if [ "$selection" == 2 ]; then
    read -rp "Enter new home directory: " new_home
    # > empty string fallback
    
    read -rp "Move current home contents? (y/N): " move
    if [[ "$move" =~ ^[Yy]$ ]]; then
        echo "sudo usermod --home $new_home --move-home $user"
    else
        echo "sudo usermod --home $new_home $user"
    fi
fi

if [ "$selection" == 3 ]; then
    read -rp "Change primary or secondary group?
[1] primary
[2] secondary
    Enter number: " gtype
    # > not 1-2 fallback
    
    if [ "$gtype" == 1 ]; then
        read -rp "Enter new primary group name: " new_group
        # > empty string fallback
        
        echo "sudo usermod --gid $new_group $user"
    fi
    
    if [ "$gtype" == 2 ]; then
        read -rp "Enter additional groups: " new_group
        # > empty string fallback
        
        echo "sudo usermod --append --groups $new_group $user"
    fi
fi






