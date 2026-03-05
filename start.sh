#!/bin/bash

echo "Starting Ghost Drift Environment..."

docker run -dit --name web1 ubuntu:22.04 sleep infinity
docker run -dit --name web2 ubuntu:22.04 sleep infinity

docker exec web1 apt update -y
docker exec web1 apt install nginx -y

docker exec web2 apt update -y
docker exec web2 apt install nginx -y

docker exec web1 nginx
docker exec web2 nginx

echo "Environment Ready ✅"