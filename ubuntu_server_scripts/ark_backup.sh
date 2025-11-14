#!/usr/bin/env bash
set -euo pipefail

# Usage: ./ark_backup.sh [hourly|daily|weekly]
[[ $# -eq 1 ]] || { echo "Usage: $0 [hourly|daily|weekly]"; exit 1; }

case "$1" in
  hourly) backupCount=24; destinationRoot="./server_backups/hourly" ;;
  daily)  backupCount=7;  destinationRoot="./server_backups/daily" ;;
  weekly) backupCount=4;  destinationRoot="./server_backups/weekly" ;;
  *) echo "Invalid schedule: $1"; exit 1 ;;
esac

sourceFolder="./ark_server/ShooterGame/Saved/SavedArks/TheIsland_WP"
timestamp="$(date +'%Y-%m-%d_%H-%M-%S')"
destinationFolder="${destinationRoot}/Backup_${timestamp}"

mkdir -p "$destinationFolder"

if command -v rsync >/dev/null 2>&1; then
  rsync -a "$sourceFolder"/ "$destinationFolder"/
else
  cp -aR "$sourceFolder"/. "$destinationFolder"/
fi

# Cleanup old backups
mapfile -t backups < <(find "$destinationRoot" -maxdepth 1 -type d -name 'Backup_*' -printf '%f\n' | sort -r)
if (( ${#backups[@]} > backupCount )); then
  for d in "${backups[@]:backupCount}"; do
    rm -rf -- "${destinationRoot}/${d}"
  done
fi
