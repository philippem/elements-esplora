#!/bin/bash

docker-compose down -v --remove-orphans
docker-compose build
docker-compose up -d bitcoind elementsd
./mine-pegin-pegout.sh
docker-compose up -d bitcoin-esplora elements-esplora
docker-compose logs -f

