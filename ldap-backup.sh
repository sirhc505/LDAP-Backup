#!/bin/sh

# Commands used:
SLAPCAT="/usr/sbin/slapcat"
GZIP="/usr/bin/gzip"
FIND="/usr/bin/find"
XARGS="/usr/bin/xargs"

# Options
DAYS_TO_KEEP="+7"
BACKUP_DIR="/var/openldap/backups"

if [ ! -d "$BACKUP_DIR" ] ;
	echo "Backup Directory [$BACKUP_DIR] does not exist! Creating..."
	mkidr $BACKUP_DIR
	echo "Done!"
fi

$SLAPCAT  -b dc=uconn,dc=edu -l $BACKUP_DIR/uconn.edu.ldif
$GZIP $BACKUP_DIR/uconn.edu.ldif --suffix -$(date '+%Y-%m-%d.gz')


$FIND $BACKUP_DIR -type f -mtime $DAYS_TO_KEEP | $XARGS rm
