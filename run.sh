#!/bin/bash
echo "echo 127.0.0.1       docker.local web1.docker.local web2.docker.local > /etc/hosts"
docker container rm --force $(docker ps -aq)
docker network rm web
docker network create web
docker-compose up -d
docker-compose up -d --scale web1=5
docker-compose up -d --scale web2=3
for i in $(seq 1 5); do { curl web1.docker.local; docker-compose logs traefik; } done
docker-compose logs -f traefik
