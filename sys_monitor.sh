#!/bin/bash

set -e
cpu_usage() {
    echo "==== CPU Usage ===="
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU Load: " 100 - $1"%"}'
}

# H�m hi?n th? th�ng tin RAM
ram_usage() {
    echo "==== RAM Usage ===="
    free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

    # ??t ng??ng c?nh b�o n?u s? d?ng RAM > 80%
    RAM_USAGE=$(free | awk '/Mem/{printf("%d"), $3/$2 * 100}')
    if [ "$RAM_USAGE" -gt 80 ]; then
        echo "Warning: High RAM usage!"
    fi
}

# H�m hi?n th? th�ng tin ? ??a
disk_usage() {
    echo "==== Disk Usage ===="
    df -h | grep '^/dev/' | awk '{ print $1 ": " $5 " used (" $4 " available)" }'
}

# G�y l?i b?ng c�ch g?i m?t l?nh kh�ng h?p l?
# non_existent_command   # L?nh kh�ng t?n t?i

# Menu ch�nh
while true; do
    clear
    echo "================================== "
    echo "Qu?n l� H? th?ng"
    echo "=================================="
    echo "1) M?c s? d?ng CPU"
    echo "2) M?c s? d?ng RAM"
    echo "3) M?c s? d?ng ? ??a"
    echo "4) Quay l?i"
    echo "=================================="
    read -r -p "Ch?n m?t t�y ch?n [1-4]: " option

    case $option in
        1)
            # Hi?n th? m?c s? d?ng CPU
            cpu_usage
            ;;
        2)
            # Hi?n th? m?c s? d?ng RAM
            ram_usage
            ;;
        3)
            # Hi?n th? m?c s? d?ng ? ??a
            disk_usage
            ;;
        4)
            # Quay l?i menu ch�nh
            break
            ;;
        *)
            # N?u l?a ch?n kh�ng h?p l?
            echo "L?a ch?n kh�ng h?p l?, vui l�ng ch?n l?i."
            ;;
    esac

    # Y�u c?u ng??i d�ng nh?n Enter ?? quay l?i menu
    echo "Nh?n Enter ?? quay l?i menu."
    read -r -p ""
done