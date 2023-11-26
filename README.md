# Provisioning ubuntu with ansible

A ansible playbook to set up a local Ubuntu machine.

## How to install

1. Checkout this repo and cd into the directory
    ```bash
    $ git clone https://github.com/modem7/ansible-ubuntu-provision.git ubuntu-provision
    $ cd ubuntu-provision
    ```
2. Specify your needed tasks in `roles/common/tasks/main.yml`
3. Specify your variables in `roles/common/vars/main.yml`
4. Run `./run.sh`