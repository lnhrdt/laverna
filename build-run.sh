#!/usr/bin/env sh
set -ex

BASEDIR=$(dirname "$0")
cd $BASEDIR
docker-compose up --build --remove-orphans -d
