#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

DOMAINS=("samorr.org" "cegepsoreltracy.store")

for DOMAIN in "${DOMAINS[@]}"; do
    echo -e "\nTesting $DOMAIN..."

    dig @localhost $DOMAIN SOA +short > /dev/null
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}$DOMAIN is working${RESET}"
    else
        echo -e "${RED}$DOMAIN failed${RESET}"
    fi
done

echo -e "\nTesting external domain (google.com)..."
dig @8.8.8.8 google.com SOA +short > /dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}google.com is working${RESET}"
else
    echo -e "${RED}google.com failed${RESET}"
fi
