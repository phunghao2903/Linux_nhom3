#!/bin/bash

while true; do
    clear
    echo "=================================="
    echo "Quản lý hệ thống"
    echo "=================================="
    echo "1) Quản lý người dùng (user_manager)"
    echo "2) Giám sát hệ thống (sys_monitor)"
    echo "3) Sao lưu hệ thống (backup)"
    echo "4) Kiểm tra mạng (network_check)"
    echo "5) Thoát"
    echo "=================================="
    read -r -p "Chọn một tùy chọn [1-5]: " option

    case $option in
        1) 
            # Gọi script quản lý người dùng
            ./user_manager.sh
            ;;
        2)
            # Gọi script giám sát hệ thống
            ./sys_monitor.sh
            ;;
        3)
            # Gọi script sao lưu
            ./backup.sh
            ;;
        4)
            # Gọi script kiểm tra mạng
            ./network_check.sh
            ;;
        5)
            # Thoát chương trình
            echo "Thoát khỏi chương trình."
            break
            ;;
        *)
            # Nếu lựa chọn không hợp lệ
            echo "Lựa chọn không hợp lệ, vui lòng chọn lại."
            sleep 2
            ;;
    esac
done
