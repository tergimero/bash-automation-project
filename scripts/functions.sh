#!/bin/bash

# Function to display messages
log_message() {
    local message="$1"
    echo "[INFO] $message"
}

# Function to check disk usage
check_disk() {
    local threshold="${1:-80}"
    local usage

    usage=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

    echo "Disk Usage: ${usage}%"

    if [ "$usage" -ge "$threshold" ]; then
        echo "[WARNING] Disk usage is high!"
        return 1
    else
        echo "[OK] Disk usage is healthy."
        return 0
    fi
}

# Function to display memory information
check_memory() {
    echo "===== MEMORY INFORMATION ====="
    vm_stat
}

# Function to display running processes
check_processes() {
    echo "===== TOP PROCESSES ====="
    ps -Ao pid,%cpu,%mem,comm -r | head -n 6 || true
}
