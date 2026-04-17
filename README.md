# ITI-Bash-Script-Project
## 📖 Overview

I built this project to practice Linux system administration using Bash scripting. Instead of running commands manually, I created a menu-driven tool using `whiptail` to make user and group management easier and more organized.

The script combines multiple administrative tasks into one interface, making it faster to manage users, groups, and passwords.


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

<img width="1089" height="776" alt="image" src="https://github.com/user-attachments/assets/aef069e9-0332-4f61-8fe8-952299fe8ba0" />



---

## ⚙️ Requirements

- Linux system (RHEL / CentOS / Rocky / Ubuntu)
- Root privileges
- `whiptail` installed

Install whiptail if not installed:

```bash
sudo yum install newt -y     # RHEL/CentOS
sudo apt install whiptail -y # Ubuntu


