#!/bin/bash

set -euo pipefail

# Create a timestamp
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Create a directory
mkdir -p output/automated_files

# Create a file only if it doesn't exist
if [ ! -f output/automated_files/info.txt ]; then
    echo "Created by Bash automation" > output/automated_files/info.txt
fi

# Create a timestamped file
touch "output/automated_files/file_$timestamp.txt"

echo "Automation completed successfully!"
