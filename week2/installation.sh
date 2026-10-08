#!/bin/bash
# CENG 3005 - Week 2
# Git + MySQL Server + MySQL Workbench installation on Linux (Ubuntu/Debian)

# update package lists
sudo apt-get update

# install git
sudo apt-get install -y git
git config --global user.name "u220709063"
git config --global user.email "bugrahancoskun@posta.mu.edu.tr"

# create a folder for the course and clone the lab repo
mkdir -p ~/ceng3005
cd ~/ceng3005
if [ ! -d dblab2026 ]; then
    git clone https://github.com/u220709063/dblab2026.git
fi
cd dblab2026
mkdir -p week2
cd week2

# install mysql server
sudo apt-get install -y mysql-server

# start mysql and enable it on boot
sudo systemctl start mysql
sudo systemctl enable mysql
sudo systemctl status mysql --no-pager

# on ubuntu root logs in with auth_socket (no password),
# so set a root password to be able to connect from workbench
read -s -p "New MySQL root password: " ROOT_PASS
echo
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$ROOT_PASS'; FLUSH PRIVILEGES;"

# check the installation
mysql --version
mysql -u root -p -e "SELECT VERSION();"

# install mysql workbench
sudo snap install mysql-workbench-community

# snap apps are sandboxed, give workbench permission to save passwords and use ssh keys
sudo snap connect mysql-workbench-community:password-manager-service
sudo snap connect mysql-workbench-community:ssh-keys

# open workbench
mysql-workbench-community &
