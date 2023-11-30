# Provisioning ubuntu with ansible

An Ansible playbook to set up a local Ubuntu machine.

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/modem7)

## How to install

1. Checkout this repo and cd into the directory
    ```bash
    git clone https://github.com/modem7/ansible-ubuntu-provision.git /srv/ubuntu-provisioning
    cd /srv/ubuntu-provisioning
    ```
2. Specify your needed tasks in `roles/common/tasks/main.yml`
3. Specify your variables in `roles/common/vars/main.yml`
4. Run `./run.sh`
