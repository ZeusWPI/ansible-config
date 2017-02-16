#!/bin/bash

ansible-vault edit vars/secrets_events.yml --vault-password-file ~/.vault-pass-events.txt $*
