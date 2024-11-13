#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <hostname>"
    exit 1
fi

HOST="$1" 

if ping -c 4 "$HOST" > /dev/null 2>&1; then
    echo "Network check: $HOST is reachable."
else
    echo "Network check: $HOST is not reachable."
fi