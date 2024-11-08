#!/bin/bash

# Kiểm tra tham số đầu vào
if [[ "$1" == "--add" ]]; then
    sudo adduser "$2"
    echo "User $2 added successfully."
elif [[ "$1" == "--delete" ]]; then
    sudo deluser "$2"
    echo "User $2 deleted successfully."
elif [[ "$1" == "--list" ]]; then
    echo "Listing all users:"
    cut -d: -f1 /etc/passwd
else
    echo "Usage: $0 --add username | --delete username | --list"
fi
