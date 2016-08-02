#!/usr/bin/env bash
#
# Removes the database dumps made by backup_databases.sh.
# This script is executed by Abyss after a backup.

set -euo pipefail


rm -r /tmp/database_dumps

