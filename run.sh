#!/usr/bin/env bash

# Make sure the script is run as root
[ "`id -u`" -ne 0 ] && echo "Please run me as root!"

# Define software packages to install
PRE_PACKAGES="auto-apt-proxy"
APT_PACKAGES="software-properties-common ansible"

# Get Ansible Version
ansible_version(){
ansible --version 2>&1 | head -n 1
}

# Configure the PPA and install ansible in master
if [ -z "$PRE_PACKAGES" ]
then
      echo "No prerequisite packages to install"
else
      apt-get install -y $PRE_PACKAGES
fi
apt-add-repository ppa:ansible/ansible -y
apt-get update
apt-get install -y $APT_PACKAGES

# Display the installed version
echo -e "\n$(ansible_version) is installed\n"

# Install prereq Galaxy roles
ansible-galaxy install -r requirements.yaml -p roles/

# Run Playbook
ansible-playbook plays/playbook.yml -i hosts.ini

rm -rf /srv/ubuntu-provisioning
rm /root/.ansible
apt-get purge -y ansible
apt-get autoremove -y
apt-add-repository --remove ppa:ansible/ansible -y

echo "Script Complete"
echo "Ready for shutdown"

exit 0