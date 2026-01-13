#! /usr/bin/env bash

startup() {
    cd /opt/hytale-server-data || echo
    exec java -jar /opt/hytale-server/Server/HytaleServer.jar --assets /opt/hytale-server/Assets.zip $SERVER_ARGS
}

if ! [ -d /opt/hytale-server-data ]; then
    mkdir /opt/hytale-server-data
fi

if [ -d /opt/hytale-server ] && [ -n "$(ls -A /opt/hytale-server)" ]; then
    startup
fi

wget https://downloader.hytale.com/hytale-downloader.zip && \
    unzip hytale-downloader.zip -d hytale-downloader && \
    rm hytale-downloader.zip

./hytale-downloader/hytale-downloader-linux-amd64 --download-path hytale-server.zip && \
    unzip ./hytale-server.zip -d /opt/hytale-server

startup