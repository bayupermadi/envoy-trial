#!/bin/bash

# docker pull envoyproxy/envoy-dev:b8558af80c7cfbe59c235b9137c4c664448f73e0
image_id=`docker images | grep -v "IMAGE ID" | grep v1 | awk '{print $3}'`
container_id=`docker ps | grep -v "CONTAINER" | grep v1 | awk '{print $1}'`
docker stop $container_id
docker rmi $image_id
docker build -t envoy:v1 .
docker run -p 9901:9901 -p 10000:10000 envoy:v1
# sleep 5
# curl http://localhost:10000