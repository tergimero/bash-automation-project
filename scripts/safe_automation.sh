#!/bin/bash

# Enable defensive scripting
set -euo pipefail

# Cleanup function
cleanup() {
    echo "[INFO] Cleaning up..."
}

# Handle interruptions
trap cleanup EXIT
trap 'exit 130' INT
trap 'exit 143' TERM

# Validate input
if [ "$#" -ne 1 ]; then
    echo "[ERROR] Usage: $0 <directory>"
    exit 1
fi

directory="$1"

# Reject empty paths and root directory
if [ -z "$directory" ] || [ "$directory" = "/" ]; then
    echo "[ERROR] Invalid directory."
    exit 1
fi

# Create directory if necessary
mkdir -p -- "$directory"

# Create a file safely
file="$directory/automation.txt"

if [ ! -f "$file" ]; then
    echo "Safe Bash automation completed." > "$file"
fi

echo "[SUCCESS] File created or already exists."
echo "[INFO] Location: $file"
