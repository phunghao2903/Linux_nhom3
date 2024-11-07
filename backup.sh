#!/bin/bash

# Kiểm tra đầu vào
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 /path/to/source /path/to/destination"
    exit 1
fi

SOURCE=$1
DESTINATION=$2
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# Tạo bản sao lưu
tar -czf "$DESTINATION/$BACKUP_NAME" "$SOURCE"
echo "Backup of $SOURCE completed at $DESTINATION/$BACKUP_NAME"
