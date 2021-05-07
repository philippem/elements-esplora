#!/bin/bash

docker-compose down -v --remove-orphans
docker-compose build
docker-compose up
