#!/bin/sh
set -e

# Ensure correct permissions for crontab file
if [ -f /var/spool/cron/crontabs/root ]; then
    chmod 600 /var/spool/cron/crontabs/root
    chown root:crontab /var/spool/cron/crontabs/root
fi

if [ $# -eq 0 ]; then
    # Start cron and follow logs
    cron
    tail -f /var/log/cron.log
fi

exec "$@"
