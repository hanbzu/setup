#!/bin/bash

# Setup
SOURCE_DIR='/home/eneibai/'
DEST_DIR='/media/backup'
EXCLUDE_DIR='/home/eneibai/Ephemeral/'

# Some information to be displayed
SOURCE_SPACE=`sudo du -ch ${SOURCE_DIR} | grep total`
echo "BACKUP."
echo "From:      ${SOURCE_DIR}"
echo "To:        ${DEST_DIR}"
echo "Excluding: ${EXCLUDE_DIR}"
echo "Source dir takes: ${SOURCE_SPACE}"
echo "Synchronising files..."

# a means recursive, v means verbose
# http://www.howtogeek.com/135533/how-to-use-rsync-to-backup-your-data-on-linux/
#sudo rsync -av --delete --exclude ${EXCLUDE_DIR} ${SOURCE_DIR} ${DEST_DIR}