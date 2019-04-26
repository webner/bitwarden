#!/bin/sh

echo "Generating key for identity server"
openssl req -x509 -newkey rsa:4096 -sha256 -nodes \
    -keyout identity.key -out identity.crt \
    -subj "/CN=Bitwarden IdentityServer" -days 10950
openssl pkcs12 -export -out /app/identity.pfx -inkey identity.key -in identity.crt \
    -certfile identity.crt -passout pass:"$globalSettings__identityServer__certificatePassword"

dotnet /app/Identity.dll
