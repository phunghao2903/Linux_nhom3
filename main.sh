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
            if [[ -f ./user_manager.sh ]]; then
                ./user_manager.sh
            else
                echo "Script user_manager.sh không tồn tại!"
            fi
            ;;
        2)
            # Gọi script giám sát hệ thống
            if [[ -f ./sys_monitor.sh ]]; then
                ./sys_monitor.sh
            else
                echo "Script sys_monitor.sh không tồn tại!"
            fi
            ;;
        3)
            # Gọi script sao lưu
            if [[ -f ./backup.sh ]]; then
                ./backup.sh
            else
                echo "Script backup.sh không tồn tại!"
            fi
            ;;
        4)
            # Gọi script kiểm tra mạng
            if [[ -f ./network_check.sh ]]; then
                ./network_check.sh
            else
                echo "Script network_check.sh không tồn tại!"
            fi
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

