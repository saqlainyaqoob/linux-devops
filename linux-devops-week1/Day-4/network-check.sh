#!/bin/bash

## This bash script will check if the network/internet is reachable or not

HOST="google.com"

echo "Checking network connectivity..."

if ping -c 1 $HOST > /dev/null; then
  echo "Internet is reachable"
else
  echo "Network unreachable"
fi

echo "Checking HTTP response..."

STATUS=$(curl -L -o /dev/null -s -w "%{http_code}" https://$HOST)

if [ "$STATUS" -eq 200 ]; then
  echo "Website reachable (HTTP 200)"
else
  echo "Website returned status $STATUS"
fi



