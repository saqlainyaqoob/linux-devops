#!/bin/bash

PROCESS="$1"

if [ -z "$PROCESS" ]; then
  echo "Usage: $0 <process-name>"
  exit 1
fi

if pgrep "$PROCESS" > /dev/null; then
  echo "Process '$PROCESS' is running"
else
  echo "Process '$PROCESS' is NOT running"
fi
