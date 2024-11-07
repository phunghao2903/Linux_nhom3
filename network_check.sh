#!/bin/bash

# Kiểm tra đầu vào
if [ -z "$1" ]; then
    echo "Usage: $0 <hostname>"
    exit 1
fi

HOST=$1

# Ping kiểm tra kết nối
ping -c 4 $HOST > /dev/null
if [ $? -eq 0 ]; then
    echo "Network check: $HOST is reachable."
else
    echo "Network check: $HOST is not reachable."
fi
