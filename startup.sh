#!/bin/sh

echo "Downloading $SPAARCHIVEURL"
curl $SPAARCHIVEURL --output archive.tar.gz
[ $? -eq 0 ] && echo "extracting $SPAARCHIVEURL" || exit 1
tar -C /usr/share/nginx/html -xzvf archive.tar.gz
[ $? -eq 0 ] && echo "$SPAARCHIVEURL extracted successfully" || exit 1
rm archive.tar.gz
[ $? -eq 0 ] && echo "deleted archived successfully" || exit 1
echo "Starting nginx"
nginx -g 'daemon off;'
