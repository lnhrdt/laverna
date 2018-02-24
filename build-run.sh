#!/usr/bin/env sh
set -ex

BASEDIR=$(dirname "$0")
cd $BASEDIR
docker-compose pull
docker-compose build --pull
docker-compose up --remove-orphans -d
