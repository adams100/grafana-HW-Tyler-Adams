#!/bin/bash

mkdir pki && cd pki
mkdir -p certs crl newcerts private
touch index.txt
echo 1000 > serial
openssl genrsa -out private/ca.key 4096
openssl req -x509 -new -key private/ca.key -days 3650 -out certs/ca.crt -config openssl.cnf -extensions v3_ca
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -config openssl.cnf 
openssl ca -config openssl.cnf -in server.csr -out server.crt -extensions v3_req
chown nobody:nobody ./*