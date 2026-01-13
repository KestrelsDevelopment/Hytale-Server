#! /usr/bin/env bash

serverJar=/opt/hytale-server/Server/HytaleServer.jar
assetsZip=/opt/hytale-server/Assets.zip

startup() {
    cd /opt/hytale-server-data || echo
    exec java -jar $serverJar --assets $assetsZip $SERVER_ARGS
}

if ! [ -d /opt/hytale-server-data ]; then
    mkdir /opt/hytale-server-data
fi

if [ -f $serverJar ] && [ -f $assetsZip ]; then
    startup
fi

wget https://downloader.hytale.com/hytale-downloader.zip && \
    unzip hytale-downloader.zip -d hytale-downloader && \
    rm hytale-downloader.zip

./hytale-downloader/hytale-downloader-linux-amd64 --download-path hytale-server.zip && \
    unzip hytale-server.zip -d /opt/hytale-server && \
    rm hytale-server.zip && \
    rm -r hytale-downloader

startup