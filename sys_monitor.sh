#!/bin/bash



set -e
# Hàm hiển thị thông tin CPU
cpu_usage() {
    echo "==== CPU Usage ===="
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU Load: " 100 - $1"%"}'
}

# Hàm hiển thị thông tin RAM
ram_usage() {
    echo "==== RAM Usage ===="
    free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

    # Đặt ngưỡng cảnh báo nếu sử dụng RAM > 80%
    RAM_USAGE=$(free | awk '/Mem/{printf("%d"), $3/$2 * 100}')
    if [ "$RAM_USAGE" -gt 80 ]; then
        echo "Warning: High RAM usage!"
    fi
}

# Hàm hiển thị thông tin ổ đĩa
disk_usage() {
    echo "==== Disk Usage ===="
    df -h | grep '^/dev/' | awk '{ print $1 ": " $5 " used (" $4 " available)" }'
}

# Gây lỗi bằng cách gọi một lệnh không hợp lệ
# non_existent_command   # Lệnh không tồn tại

# Menu chính
while true; do
    clear
    echo "=================================="
    echo "Quản lý Hệ thống"
    echo "=================================="
    echo "1) Mức sử dụng CPU"
    echo "2) Mức sử dụng RAM"
    echo "3) Mức sử dụng ổ đĩa"
    echo "4) Quay lại"
    echo "=================================="
    read -p "Chọn một tùy chọn [1-4]: " option

    case $option in
        1)
            # Hiển thị mức sử dụng CPU
            cpu_usage
            ;;
        2)
            # Hiển thị mức sử dụng RAM
            ram_usage
            ;;
        3)
            # Hiển thị mức sử dụng ổ đĩa
            disk_usage
            ;;
        4)
            # Quay lại menu chính
            break
            ;;
        *)
            # Nếu lựa chọn không hợp lệ
            echo "Lựa chọn không hợp lệ, vui lòng chọn lại."
            ;;
    esac

    # Yêu cầu người dùng nhấn Enter để quay lại menu
    echo "Nhấn Enter để quay lại menu."
    read -p ""
done

