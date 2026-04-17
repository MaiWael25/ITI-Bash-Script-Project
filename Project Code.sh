 #!/bin/bash                                                                                                                                                                                                                

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

while true; do

CHOICE=$(whiptail --title "User Management Menu" --menu "Choose an option" 25 75 15 \
"Add User" "Add a user to the system." \
"Modify User" "Modify username." \
"Delete User" "Delete an existing user." \
"List Users" "List all users." \
"Disable User" "Lock user account." \
"Enable User" "Unlock user account." \
"Change Password" "Change user password." \
"Add Group" "Add a group." \
"Modify Group" "Add user to group." \
"Delete Group" "Delete a group." \
"List Groups" "List all groups." \
"Exit" "Exit program." \
3>&1 1>&2 2>&3)

case $CHOICE in

"Add User")
    USERNAME=$(whiptail --inputbox "Enter username:" 10 40 3>&1 1>&2 2>&3)
    if id "$USERNAME" &>/dev/null; then
        whiptail --msgbox "User already exists!" 8 40
    else
        useradd "$USERNAME"
        passwd "$USERNAME"
        whiptail --msgbox "User created successfully." 8 40
    fi
    ;;

"Modify User")
USERNAME=$(whiptail --inputbox "Enter current username:" 10 40 3>&1 1>&2 2>&3)

if id "$USERNAME" &>/dev/null; then

    NEWNAME=$(whiptail --inputbox "Enter new username:" 10 40 3>&1 1>&2 2>&3)

    if id "$NEWNAME" &>/dev/null; then
        whiptail --msgbox "Username already exists!" 8 40
    else
        usermod -l "$NEWNAME" "$USERNAME"
        whiptail --msgbox "Username changed successfully." 8 40
    fi

else
    whiptail --msgbox "User does not exist!" 8 40
fi
;;

"Delete User")
    USERNAME=$(whiptail --inputbox "Enter username to delete:" 10 40 3>&1 1>&2 2>&3)
    if id "$USERNAME" &>/dev/null; then
        userdel -r "$USERNAME"
        whiptail --msgbox "User deleted." 8 40
    else
        whiptail --msgbox "User not found!" 8 40
    fi
    ;;

"List Users")
awk -F: '$3 >= 1000 {print $1}' /etc/passwd > /tmp/users.txt
whiptail --textbox /tmp/users.txt 20 60
;;

"Disable User")
    USERNAME=$(whiptail --inputbox "Enter username to lock:" 10 40 3>&1 1>&2 2>&3)
    if id "$USERNAME" &>/dev/null; then
        usermod -L "$USERNAME"
        whiptail --msgbox "User account locked." 8 40
    else
        whiptail --msgbox "User not found!" 8 40
    fi
    ;;

"Enable User")
    USERNAME=$(whiptail --inputbox "Enter username to unlock:" 10 40 3>&1 1>&2 2>&3)
    if id "$USERNAME" &>/dev/null; then
        usermod -U "$USERNAME"
        whiptail --msgbox "User account unlocked." 8 40
    else
        whiptail --msgbox "User not found!" 8 40
    fi
    ;;

"Change Password")
    USERNAME=$(whiptail --inputbox "Enter username:" 10 40 3>&1 1>&2 2>&3)
    if id "$USERNAME" &>/dev/null; then
        passwd "$USERNAME"
        whiptail --msgbox "Password updated successfully." 8 40
    else
        whiptail --msgbox "User not found!" 8 40
    fi
    ;;

"Add Group")
    GROUP=$(whiptail --inputbox "Enter group name:" 10 40 3>&1 1>&2 2>&3)
    if getent group "$GROUP" >/dev/null; then
        whiptail --msgbox "Group already exists!" 8 40
    else
        groupadd "$GROUP"
        whiptail --msgbox "Group created." 8 40
    fi
    ;;

"Modify Group")
    USER=$(whiptail --inputbox "Enter username:" 10 40 3>&1 1>&2 2>&3)
    GROUP=$(whiptail --inputbox "Enter group:" 10 40 3>&1 1>&2 2>&3)
    if id "$USER" &>/dev/null && getent group "$GROUP" >/dev/null; then
        usermod -aG "$GROUP" "$USER"
        whiptail --msgbox "User added to group." 8 40
    else
        whiptail --msgbox "User or group not found!" 8 40
    fi
    ;;

"Delete Group")
    GROUP=$(whiptail --inputbox "Enter group to delete:" 10 40 3>&1 1>&2 2>&3)
    if getent group "$GROUP" >/dev/null; then
        groupdel "$GROUP"
        whiptail --msgbox "Group deleted." 8 40
    else
        whiptail --msgbox "Group not found!" 8 40
    fi
    ;;

"List Groups")
awk -F: '$3 >= 1000 {print $1}' /etc/group > /tmp/groups.txt
whiptail --textbox /tmp/groups.txt 20 60
;;

"Exit")
    clear
    exit
    ;;

*)
    break
    ;;

esac

done



