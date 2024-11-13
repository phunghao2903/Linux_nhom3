#!/bin/bash

set -e

# Hàm hiển thị menu sao lưu
backup_menu() {
    echo "==== Backup Menu ===="
    echo "1) Chọn thư mục nguồn"
    echo "2) Chọn thư mục đích"
    echo "3) Thực hiện sao lưu"
    echo "4) Thoát"
}

# Biến lưu đường dẫn thư mục nguồn và đích
SOURCE=""
DESTINATION=""
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Hàm chọn thư mục nguồn
select_source() {
    read -r -p "Nhập đường dẫn thư mục nguồn: " SOURCE
    if [ ! -d "$SOURCE" ]; then
        echo "Lỗi: Thư mục nguồn không tồn tại!"
        SOURCE=""
    else
        echo "Thư mục nguồn đã chọn: $SOURCE"
    fi
}

# Hàm chọn thư mục đích
select_destination() {
    read -r -p "Nhập đường dẫn thư mục đích: " DESTINATION
    if [ ! -d "$DESTINATION" ]; then
        echo "Lỗi: Thư mục đích không tồn tại!"
        DESTINATION=""
    else
        echo "Thư mục đích đã chọn: $DESTINATION"
    fi
}

# Hàm thực hiện sao lưu
perform_backup() {
    if [ -z "$SOURCE" ] || [ -z "$DESTINATION" ]; then
        echo "Vui lòng chọn thư mục nguồn và đích trước khi sao lưu."
        return
    fi

    BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
    echo "Đang tạo bản sao lưu của $SOURCE tại $DESTINATION/$BACKUP_NAME..."

    if tar -czf "$DESTINATION/$BACKUP_NAME" "$SOURCE"; then
        echo "Sao lưu hoàn tất: $DESTINATION/$BACKUP_NAME"
    else
        echo "Sao lưu thất bại!"
    fi
}

# Vòng lặp menu chính
while true; do
    clear
    echo "=================================="
    echo "Chương trình Sao lưu Hệ thống"
    echo "=================================="
    backup_menu
    echo "=================================="
    read -r -p "Chọn một tùy chọn [1-4]: " option

    case $option in
        1)
            select_source
            ;;
        2)
            select_destination
            ;;
        3)
            perform_backup
            ;;
        4)
            echo "Thoát chương trình..."
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

