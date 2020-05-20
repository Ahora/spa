#!/bin/sh

echo "Downloading $SPAARCHIVEURL"
curl $SPAARCHIVEURL --silent --output archive.tar.gz
[ $? -eq 0 ]  || exit 1
echo "extracting $SPAARCHIVEURL"
tar -C /usr/share/nginx/html -xzvf archive.tar.gz
[ $? -eq 0 ]  || exit 1
echo "$SPAARCHIVEURL extracted successfully"
rm archive.tar.gz
echo "Starting nginx"
nginx -g 'daemon off;'
