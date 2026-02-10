#!/usr/bin/env bash

# create backup of /data at ~/backup_YYYY-MM-DD.tar.gz

BACKUP_DIR="/data"
# > no directory fallback

DEST_DIR="/home/backup"
DATE=$(date +%F)
ARCHIVE="$DEST_DIR/backup_$DATE.tgz"

tar -czf "$ARCHIVE" -C / "$BACKUP_DIR"
chown backup:backup "$ARCHIVE"
echo "Backup created: $ARCHIVE"