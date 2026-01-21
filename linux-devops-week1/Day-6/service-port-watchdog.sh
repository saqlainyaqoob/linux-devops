#!/bin/bash

## MULTI-SERVICE & PORT WATCHDOG SCRIPT

LOG_DIR="$HOME/cron-jobs"
LOG_FILE="$LOG_DIR/service-port-watchdog.log"
mkdir -p "$LOG_DIR"

# Ensure at least one argument
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <service1:port1> [<service2:port2> ...]"
  echo "Example: $0 ssh:22 nginx:80 docker:2375"
  exit 1
fi

echo "----------------------------" | tee -a "$LOG_FILE"
echo "Check Time: $(date)" | tee -a "$LOG_FILE"



# Loop through all arguments
for ARG in "$@"; do
  ARG=$(echo "$ARG" | tr -d ' ')
  SERVICE=$(echo "$ARG" | cut -d':' -f1)
  PORT=$(echo "$ARG" | cut -d':' -f2)

  # Validate format
  if [ -z "$SERVICE" ] || [ -z "$PORT" ]; then
    echo "Invalid argument '$ARG'. Use service:port format." | tee -a "$LOG_FILE"
    continue
  fi

  # Service check
  if systemctl is-active --quiet "$SERVICE"; then
    echo "Service '$SERVICE' is running" | tee -a "$LOG_FILE"
  else
    echo "ALERT: Service '$SERVICE' is NOT running" | tee -a "$LOG_FILE"
  fi

  # Port check
  if ss -tuln | grep -q ":$PORT "; then
    echo "Port $PORT is listening" | tee -a "$LOG_FILE"
  else
    echo "ALERT: Port $PORT is NOT listening" | tee -a "$LOG_FILE"
  fi
done












































