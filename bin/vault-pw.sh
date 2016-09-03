#!/bin/bash

PW=$(<~/.vault-pass.txt) || read -p "Please enter vault password: " -s PW

echo $PW
