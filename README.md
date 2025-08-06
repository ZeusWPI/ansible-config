# ansible-config

Ansible is the system that automatically installs the Zeus servers (King, Adams, Dickens, Herbert and Tolkien).
See also https://docs.ansible.com.

## Setup

1. Install Ansible (`brew install ansible` on OS X)
2. Clone this repository
3. Run `ansible-galaxy install -r requirements.yml` to setup the needed roles
3. Set the server password in `.vault-pass.txt`
4. Ask current sysadmins to add your SSH key to `vars/authorized_keys.yml`

## Deploy

You can run `ansible-playbook site.yml` to deploy a whole playbook. This will probably be pretty slow when developing, so you can also run `ansible-playbook site.yml --tags db` for example to only deploy the tasks tagged with `db`.

The passwords are saved in `vars/secrets.yml`. These files can be edited
by issuing the command `ansible-vault edit vars/secrets.yml`.
