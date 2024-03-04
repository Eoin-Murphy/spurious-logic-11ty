#!/bin/bash -x
set -euo pipefail
npx @11ty/eleventy

source 'secrets/passwords.txt'

echo "Username: $username"
echo "Password: $password"
echo "URL: $url"
echo "port: $port"

# Log in to the FTP server
lftp $url $port << EOF
user $username $password
set ssl:verify-certificate no
cd webspace/httpdocs/sl
mirror --delete --reverse _site .
exit
EOF
