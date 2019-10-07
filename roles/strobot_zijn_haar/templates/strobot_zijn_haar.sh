#!/bin/bash

# read mail from stdin
content=$(tee)
# send original mail
echo "$content" | procmail "$@"

# base64 encode content
encoded_content=$(echo "$content" | base64 --wrap=0)
# send mail to endpoint
curl -d "$encoded_content" --header "Content-Type: text" -X POST "{{ endpoint }}"
