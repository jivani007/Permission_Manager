#!/bin/bash
# Mini Project: Permission & Ownership Manager

# Function to show file details
show_details() {
    echo "---------------------------------"
    ls -l $1
    echo "---------------------------------"
}

# Menu system
while true; do
    echo "===== Permission Manager ====="
    echo "1. Create file"
    echo "2. Change permissions (chmod)"
    echo "3. Change ownership (chown)"
    echo "4. Show file details"
    echo "5. Exit"
    read -p "Choose an option [1-5]: " choice

    case $choice in
        1)
            read -p "Enter filename to create: " fname
            touch $fname
            echo "File '$fname' created."
            show_details $fname
            ;;
        2)
            read -p "Enter filename: " fname
            read -p "Enter permission (e.g., 755 or u+x): " perm
            chmod $perm $fname
            echo "Permissions updated!"
            show_details $fname
            ;;
        3)
            read -p "Enter filename: " fname
            read -p "Enter new owner (username): " owner
            read -p "Enter new group (or press Enter to skip): " group
            if [ -z "$group" ]; then
                sudo chown $owner $fname
            else
                sudo chown $owner:$group $fname
            fi
            echo "Ownership updated!"
            show_details $fname
            ;;
        4)
            read -p "Enter filename: " fname
            show_details $fname
            ;;
        5)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option, try again!"
            ;;
    esac
done
