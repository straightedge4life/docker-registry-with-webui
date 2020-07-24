#!/bin/sh
mkdir $(pwd)/data
mkdir $(pwd)/db
openssl req -new -newkey rsa:4096 -days 9999 -subj "/CN=localhost" \
        -nodes -x509 -keyout conf/auth.key -out conf/auth.cert