#! /usr/bin/env bash

docker logs -n 100 hytale-server
docker attach hytale-server