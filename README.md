# ITI-Bash-Script-Project
# 🐧 Linux User & Group Management Tool (Bash + Whiptail)

This project is a simple interactive Bash script that helps manage users and groups on a Linux system using a text-based interface built with `whiptail`.

It is designed as a hands-on project to practice Linux system administration tasks similar to those required in RHCSA.

---

## 🚀 Features

- Add new users
- Modify user shell
- Delete users
- Lock (disable) user accounts
- Unlock (enable) user accounts
- Change user passwords
- List all system users

- Add new groups
- Add users to groups
- Delete groups
- List all groups

---

## 🖥️ Demo

The script provides a menu-driven interface like this:

User Management Menu

Add User
Modify User
Delete User
List Users
Disable User
Enable User
Change Password
Add Group
Modify Group
Delete Group
List Groups
Exit


---

## ⚙️ Requirements

- Linux system (RHEL / CentOS / Rocky / Ubuntu)
- Root privileges
- `whiptail` installed

Install whiptail if not installed:

```bash
sudo yum install newt -y     # RHEL/CentOS
sudo apt install whiptail -y # Ubuntu


