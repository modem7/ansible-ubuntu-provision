#!/usr/bin/env bash

# Define software packages to install
PRE_PACKAGES="auto-apt-proxy"
APT_PACKAGES="software-properties-common ansible"

# Get Ansible Version
ansible_version(){
ansible --version 2>&1 | head -n 1
}

# Configure the PPA and install ansible in master
sudo apt-get install -y $PRE_PACKAGES
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install -y $APT_PACKAGES

# Display the installed version
echo -e "\n$(ansible_version) is installed\n"

ansible-playbook plays/playbook.yml -i hosts.ini

exit 0
