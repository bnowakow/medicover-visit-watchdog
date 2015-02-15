#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Not enough number of parameters"
    echo "Usage: $0 SENDGRID_USERNAME SENDGRID_PASSWORD"
    exit
fi
SENDGRID_USERNAME=$1 SENDGRID_PASSWORD=$2 rails s
