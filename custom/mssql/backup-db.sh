#!/bin/sh
#
export now=${1:-$(date +%Y%m%d_%H%M%S)}

/opt/mssql-tools/bin/sqlcmd -S ${MSSQL_HOST} -U sa -P ${SA_PASSWORD} -i /backup-db.sql

echo $now
