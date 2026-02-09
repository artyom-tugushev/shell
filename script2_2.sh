#!/usr/bin/env bash

# show user's sudo usage history

read -rp "username: " user
# > empty string fallback
# > no user found fallback

home_dir=$(getent passwd "$user" | cut -d: -f6)
history_file="$home_dir/.bash_history"
# > no .bash_history file fallback

echo "grep sudo '$history_file'"
# > no sudo usage lines fallback