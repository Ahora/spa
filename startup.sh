#!/bin/sh

echo "Downloading $SPAARCHIVEURL"
curl $SPAARCHIVEURL --silent --output archive.tar.gz
echo "extracting $SPAARCHIVEURL"
tar -C /usr/share/nginx/html -zxf archive.tar.gz
rm archive.tar.gz
echo "Starting nginx"
nginx -g 'daemon off;'
