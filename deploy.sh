#!/bin/bash
set -euo pipefail
npx @11ty/eleventy

exec ./secrets/passwords.sh

# Log in to the FTP server
lftp $FTP_SERVER $FTP_PORT << EOF
user $FTP_USER $FTP_PASS
set ssl:verify-certificate no
cd webspace/httpdocs/sl
mirror --delete --reverse _site .
exit
EOF
