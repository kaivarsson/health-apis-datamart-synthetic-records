#!/usr/bin/env bash

if [ "$1" == "clean" ]
then
  mvn -P'!standard' -P '!gov.va.api.health' -Plocal clean
  exit
fi
mvn -P'!standard' -P '!gov.va.api.health' -Prelease install
