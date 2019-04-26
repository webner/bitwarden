#!/usr/bin/env bash

# Extract relevant part from huge connection string stored in configmap
rawService=$(echo $globalSettings__sqlServer__connectionString | grep -o "tcp:.*,1433")

# Remove tcp: and ,1433 to get the service hostname
mssqlService=${rawService:4:-5}

if [[ -z $mssqlService ]]; then
    echo "Could not infer mssql-service"
    exit 1
fi

until timeout 1 bash -c "cat < /dev/null > /dev/tcp/$mssqlService/1433"
do
    echo "Waiting for mssql service to become available"
    sleep 5
done;

echo "Successfully reached mssql at $mssqlService"

echo "mssql $mssqlService" > /tmp/hosts

echo "globalSettings__sqlServer__connectionString=$globalSettings__sqlServer__connectionString" >/bitwarden/env/global.override.env
echo "SA_PASSWORD=$SA_PASSWORD" > /bitwarden/env/mssql.override.env
echo "Starting setup command"
echo "Using HOSTALIASES=" $(cat /tmp/hosts)
exec env HOSTALIASES=/tmp/hosts "$@"
