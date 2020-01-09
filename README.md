# LDAP Backup Script

## Installation

### Clone Repo

Download this from stash:

```sh
git clone ssh://git@atl-stash.uits.uconn.edu:7999/ldap/ldapbackups.git
```

### Set Options

There are only two options:

DAYS_TO_KEEP: This is the number of days of backups that you want to keep

BACKUP_DIR: This is the location of the backups. It is recommend (but not required) to be a mount point of a drive dedicated to storing backups.

```ini
DAYS_TO_KEEP="+7"
BACKUP_DIR="/var/openldap/backups"
```

## Usage

This script is intended to be run from crontab. So, edit root's crontab:

```sh
crontab -e
```

We run a major update at 5AM for uconnpeople.txt so it is recommended that the backup be run at least one hour prior to that.

```text
0 3 * * * /bin/bash /opt/ldapbackups/ldap-backup.sh
```

## Created By

Christopher Tarricone chris at uconn dot edu