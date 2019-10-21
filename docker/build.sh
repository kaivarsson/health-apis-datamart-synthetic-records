#!/usr/bin/env bash

NAME=vasdvp/health-apis-synthetic-records-builder:latest

set -e
docker build -t $NAME .

if [ "${1:-}" == "push" ]; then docker push $NAME; fi
