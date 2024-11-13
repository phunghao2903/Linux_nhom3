#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 /path/to/source /path/to/destination"
    exit 1
fi

SOURCE=$1
DESTINATION=$2
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

if [ ! -d "$SOURCE" ]; then
    echo "Error: Source directory $SOURCE does not exist."
    exit 1
fi

if [ ! -d "$DESTINATION" ]; then
    echo "Error: Destination directory $DESTINATION does not exist."
    exit 1
fi

tar -czf "$DESTINATION/$BACKUP_NAME" "$SOURCE"
if tar -czf "$DESTINATION/$BACKUP_NAME" "$SOURCE"; then
    echo "Backup of $SOURCE completed at $DESTINATION/$BACKUP_NAME"
else
    echo "Backup failed"
fi
