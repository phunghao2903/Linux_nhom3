#!/bin/bash

# Hiển thị mức sử dụng CPU
echo "==== CPU Usage ===="
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU Load: " 100 - $1"%"}'

# Hiển thị mức sử dụng RAM
echo "==== RAM Usage ===="
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

# Hiển thị mức sử dụng ổ đĩa
echo "==== Disk Usage ===="
df -h | grep '^/dev/' | awk '{ print $1 ": " $5 " used (" $4 " available)" }'

# Đặt ngưỡng cảnh báo nếu cần (ví dụ: RAM > 80%)
RAM_USAGE=$(free | awk '/Mem/{printf("%d"), $3/$2 * 100}')
if [ "$RAM_USAGE" -gt 80 ]; then
    echo "Warning: High RAM usage!"
fi
