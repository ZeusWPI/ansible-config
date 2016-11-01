#!/bin/bash

cat ~/.vault-pass.txt 2> /dev/null || (read -p "Please enter vault password: " -s PW && echo $PW)


