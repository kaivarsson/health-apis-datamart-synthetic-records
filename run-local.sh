#!/usr/bin/env bash

cd $(readlink -f $(dirname $0))

export ENVIRONMENT=local
if [ "$1" == "clean" ]
then
  ./build.sh clean
  exit
fi
./build.sh
