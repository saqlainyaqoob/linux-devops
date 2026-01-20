#!/bin/bash

#I use cron jobs to automate resource monitoring scripts and define thresholds
#To detect issues before they impact production

THRESHOLD=80

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

MEM_USAGE=$(free | awk '/Mem/ {printf("%.0f"), $3/$2 * 100}')

echo "Disk usage: ${DISK_USAGE}%"
echo "Memory usage: ${MEM_USAGE}%"

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
  echo "WARNING: Disk usage above ${THRESHOLD}%"
fi

if [ "$MEM_USAGE" -gt "$THRESHOLD" ]; then
  echo "WARNING: Memory usage above ${THRESHOLD}%"
fi
