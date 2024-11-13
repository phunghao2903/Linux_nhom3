#!/bin/bash

# Menu con cho user_manager
while true; do
    clear
    echo "=================================="
    echo "Quản lý người dùng"
    echo "=================================="
    echo "1) Thêm người dùng (add)"
    echo "2) Xóa người dùng (delete)"
    echo "3) Liệt kê người dùng (list)"
    echo "4) Tìm người dùng (search)"
    echo "5) Quay lại"
    echo "=================================="
    read -r -p "Chọn một tùy chọn [1-5]: " option

    case $option in
        1)
            # Thêm người dùng
            while true; do
                read -r -p "Nhập tên người dùng muốn thêm: " username
                if [ -z "$username" ]; then
                    echo "Tên người dùng không được để trống. Vui lòng thử lại."
                elif id "$username" &>/dev/null; then
                    echo "Người dùng $username đã tồn tại. Vui lòng chọn tên người dùng khác."
                else
                    sudo adduser "$username"
                    if [ $? -eq 0 ]; then
                        echo "Người dùng $username đã được thêm thành công."
                    else
                        echo "Có lỗi xảy ra khi thêm người dùng $username."
                    fi
                    break
                fi
            done
            ;;
        2)
            # Xóa người dùng
            while true; do
                read -r -p "Nhập tên người dùng muốn xóa: " username
                if [ -z "$username" ]; then
                    echo "Tên người dùng không được để trống. Vui lòng thử lại."
                elif ! id "$username" &>/dev/null; then
                    echo "Người dùng $username không tồn tại. Vui lòng kiểm tra lại tên người dùng."
                else
                    sudo deluser "$username"
                    if [ $? -eq 0 ]; then
                        echo "Người dùng $username đã được xóa thành công."
                    else
                        echo "Có lỗi xảy ra khi xóa người dùng $username."
                    fi
                    break
                fi
            done
            ;;
        3)
            # Liệt kê người dùng
            echo "Danh sách người dùng trên hệ thống:"
            cut -d: -f1 /etc/passwd
            ;;
        4)
            # Tìm người dùng
            read -r -p "Nhập tên người dùng cần tìm: " username
            if [ -z "$username" ]; then
                echo "Vui lòng nhập tên người dùng để tìm."
            else
                echo "Tìm kiếm người dùng: $username"
                # Dùng grep để tìm người dùng trong /etc/passwd
                grep -i "$username" /etc/passwd
                if [ $? -eq 0 ]; then
                    echo "Người dùng đã được tìm thấy."
                else
                    echo "Không tìm thấy người dùng $username."
                fi
            fi
            ;;
        5)
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
    read -r
done

