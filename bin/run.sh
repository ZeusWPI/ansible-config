#!/bin/bash

ansible-playbook -i hosts site.yml --vault-password-file ~/.vault-pass.txt $*
