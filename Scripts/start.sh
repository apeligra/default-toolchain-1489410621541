#!/bin/bash

rm -r /tmp/keyValStore;
# Tag the latest version of fabric-baseimage
docker pull hyperledger/fabric-baseimage:x86_64-0.1.0
docker tag hyperledger/fabric-baseimage:x86_64-0.1.0 hyperledger/fabric-baseimage:latest
cd ../Demo;
docker-compose kill;
docker-compose down;
docker-compose build;
docker rm $(docker ps -aq);
docker-compose up -d;
cd ../Scripts;
