#!/bin/bash

printf "This script takes file name as an input and analyzes if its a file or directory and displays its type and permission details.\n\n"


FILE="$1"

# 1. Check argument
if [ -z "$FILE" ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# 2. Check file exists
if [ ! -e "$FILE" ]; then
  echo "Error: File does not exist"
  exit 1
fi

# 3. File details
echo "File details:"
ls -l "$FILE"

# 4. File type
if [ -f "$FILE" ]; then
  echo "Type: Regular file"
elif [ -d "$FILE" ]; then
  echo "Type: Directory"
else
  echo "Type: Other"
fi

# 5. Permission checks
[ -r "$FILE" ] && echo "Readable: YES" || echo "Readable: NO"
[ -w "$FILE" ] && echo "Writable: YES" || echo "Writable: NO"
[ -x "$FILE" ] && echo "Executable: YES" || echo "Executable: NO"

# 6. Numeric permissions
PERM=$(stat -c "%a" "$FILE")
echo "Numeric permissions: $PERM"

