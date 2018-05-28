#!/bin/bash
docker run  --restart=always -d --name ddns-updater -v $PWD/config.json:/opt/my-ddns/config.json j796160836/docker-ddns-updater