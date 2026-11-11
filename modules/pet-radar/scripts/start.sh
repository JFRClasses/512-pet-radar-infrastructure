#!/bin/bash
mkdir -p /containers/pet-radar-api
set -e

export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" > /etc/apt/sources.list.d/docker.list
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable --now docker
usermod -aG docker ubuntu
cd /containers/pet-radar-api

echo "${compose_base64}" | base64 -d > compose.yaml

cat > .env <<ENV
MAILER_SERVICE=${MAILER_SERVICE}
MAILER_USER=${MAILER_USER}
MAILER_PASSWORD=${MAILER_PASSWORD}
MAPBOX_TOKEN=${MAPBOX_TOKEN}
DB_PASSWORD=${DB_PASSWORD}
DB_NAME=${DB_NAME}
DB_USER=${DB_USER}
DB_HOST=${DB_HOST}
DB_PORT=${DB_PORT}
DB_TYPE=${DB_TYPE}
REDIS_HOST=${REDIS_HOST}
REDIS_PORT=${REDIS_PORT}
ENV

docker compose up -d