#!/bin/bash

# Usage: ./bin/run_ask_pass.sh playbook.yml
ansible-playbook -i hosts --ask-vault-pass -v $*
