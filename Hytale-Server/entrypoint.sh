#! /usr/bin/env bash

if ! [ -d /opt/hytale-server-data ]; then
    mkdir /opt/hytale-server-data
fi

if [ -d /opt/hytale-server ] && [ -n "$(ls -A /opt/hytale-server)" ]; then
    cd /opt/hytale-server-data
    exec java -jar /opt/hytale-server/Server/HytaleServer.jar --assets /opt/hytale-server/Assets.zip
fi

wget https://downloader.hytale.com/hytale-downloader.zip && \
    unzip hytale-downloader.zip -d hytale-downloader && \
    rm hytale-downloader.zip

./hytale-downloader/hytale-downloader-linux-amd64 && \
    unzip ./*.zip -d /opt/hytale-server

cd /opt/hytale-server-data
exec java -jar /opt/hytale-server/Server/HytaleServer.jar --assets /opt/hytale-server/Assets.zip