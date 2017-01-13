#!/bin/bash

# Usage: ./bin/run_pass_file.sh playbook.yml
ansible-playbook -i hosts --vault-password-file ~/.vault-pass-events.txt -v $*
