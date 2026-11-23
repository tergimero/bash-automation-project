#!/bin/bash

set -euo pipefail

# Locate the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Load reusable functions
source "$SCRIPT_DIR/functions.sh"

log_message "Starting System Health Monitor"

echo "===== SYSTEM HEALTH REPORT ====="
echo "Date: $(date)"
echo ""

if check_disk 80; then
    log_message "Disk check passed."
else
    echo "[ERROR] Disk usage exceeded threshold."
    exit 1
fi

echo ""
check_memory

echo ""
check_processes

echo ""
log_message "System health check completed."
