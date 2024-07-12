#!/bin/bash

if [ -f "$CERTS" ];
then
    echo "Certificate file exists. Checking validity."
    if openssl x509 -checkend 86400 -noout -in $CERTS;
    then
        echo "Certificate is still valid, no need to generate a new one."
    else
        echo "Certificate has expired, generating a new one."
    fi
else
    echo "Certificate file does not exist, generating a new one."
fi

if [ ! -f "$CERTS" ] || ! openssl x509 -checkend 86400 -noout -in $CERTS;
then
    echo "Generating a private key."
    openssl genrsa -out $KEY 2048

    echo "Generating a certificate signing request."
    openssl req -new -key $KEY -out $CERTS -subj "$CERTS_INFO"

    echo "Generating a self-signed certificate."
    openssl x509 -req -days 365 -in $CERTS -signkey $KEY -out $CERTS

    echo "Copying nginx configuration file to the default location."
    envsubst '$$DOMAIN_NAME $$PROTOCOL_TLS $$CERTS $$KEY $$PORT' < /default.conf > /etc/nginx/conf.d/default.conf
fi

echo "Starting nginx..."
nginx -g "daemon off;"