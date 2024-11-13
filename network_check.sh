#!/bin/bash

# Kiểm tra đầu vào
if [ -z "$1" ]; then
    echo "Usage: $0 <hostname>"
    exit 1
fi

HOST=$1

# Yêu cầu người dùng nhập thêm thông tin (ví dụ: một địa chỉ email)
read -r -p "Enter your email: " email

# In ra thông tin vừa nhập
echo "You entered email: $email"

# Ping kiểm tra kết nối
if ping -c 4 "$HOST" > /dev/null; then
    echo "Network check: $HOST is reachable."
else
    echo "Network check: $HOST is not reachable."
fi
