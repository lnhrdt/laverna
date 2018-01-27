#!/usr/bin/env sh
set -ex

BASEDIR=$(dirname "$0")
cd $BASEDIR
docker-compose build --no-cache
docker-compose restart

