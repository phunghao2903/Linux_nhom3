#!/bin/bash

set -e

# Hàm hiển thị thông tin địa chỉ IP
ip_info() {
    echo "==== IP Information ===="
    ip -4 addr show | grep inet | awk '{print $2}'
}

# Hàm hiển thị trạng thái kết nối mạng
network_status() {
    echo "==== Network Status ===="
    if ping -c 1 google.com &> /dev/null; then
        echo "Internet connection: Connected"
    else
        echo "Internet connection: Disconnected"
    fi
}

# Hàm kiểm tra các cổng đang mở
open_ports() 
    echo "==== Open Ports ===="
    sudo netstat -tuln | grep LISTEN
}

# Hàm kiểm tra tốc độ mạng
network_speed() {
    echo "==== Network Speed ===="
    # Kiểm tra nếu đã có speedtest CLI
    if command -v speedtest &> /dev/null; then
        speedtest --simple
    else
        echo "Speedtest CLI chưa được cài đặt. Vui lòng cài đặt bằng lệnh 'sudo apt install speedtest-cli'."
    fi
}

# Menu chính
while true; do
    clear
    echo "=================================="
    echo "Quản lý Hệ thống"
    echo "=================================="
    echo "1) Xem thông tin địa chỉ IP"
    echo "2) Kiểm tra trạng thái mạng"
    echo "3) Kiểm tra các cổng đang mở"
    echo "4) Kiểm tra tốc độ mạng"
    echo "5) Quay lại"
    echo "=================================="
    read -r -p "Chọn một tùy chọn [1-5]: " option

    case $option in
        1)
            ip_info
            ;;
        2)
            network_status
            ;;
        3)
            open_ports
            ;;
        4)
            network_speed
            ;;
        5)
            break
            ;;
        *)
            echo "Lựa chọn không hợp lệ, vui lòng chọn lại."
            ;;
    esac

    # Yêu cầu người dùng nhấn Enter để quay lại menu
    echo "Nhấn Enter để quay lại menu."
    read -r -p ""
done
