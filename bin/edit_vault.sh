#!/bin/bash

ansible-vault edit vars/passwords.yml --vault-password-file ~/.vault-pass.txt $*
