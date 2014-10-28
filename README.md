ansible-config
==============

Ansible is the system that automatically installs the Zeus servers (specifically Abyss and King).
To run ansible install ansible and run the following command: `ansible-playbook -- ask-vault-pass site.yml -i hosts`
The passwords are saved in host_variables/passwords.yml. This file can be edited
by issuing the command `ansible-vault edit passwords.yml` when in the same
directory. The password used to encrypt this is the root password.
