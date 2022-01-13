#!/usr/bin/env bash

set -e
WORKING_DIR=$(greadlink -f $(dirname $0))
cd $WORKING_DIR

usage() {
  cat <<EOF
$1

Usage:

  Commands:
    help      Opens this menu
    clean     Drops/Rebuilds the tables in an already existing database
    start     Creates a brand new database and loads it

EOF
exit 1
}

main() {
  brew install coreutils
  brew install flyway
  case "$1" in
    help|[-]*help) usage "I cant even with this...";;
    start) createDatabase; shift; break;;
  esac

  syntheticRecordsBuilder

  loadDatabase $@
}

syntheticRecordsBuilder() {
  cd $WORKING_DIR/docker
  docker build -t vasdvp/health-apis-synthetic-records-builder:local .
  cd $WORKING_DIR
}

createDatabase() {
  # SQL Server Docker Image (You don't have to install anything!!!)
  docker pull mcr.microsoft.com/mssql/server:2017-latest

  # Run the docker image, but make sure its configuration matches the local ones
  # that were set.
  [ -f "environments/local.conf" ] && . environments/local.conf
  [ -z "$FLYWAY_PASSWORD" ] && "Help! I can't seem to find my password(FLYWAY_PASSWORD)!" && exit 1
  docker run \
    --name "dqdb-mac" \
    -e 'ACCEPT_EULA=Y' \
    -e "SA_PASSWORD=$FLYWAY_PASSWORD" \
    -p 1433:1433 \
    -d mcr.microsoft.com/mssql/server:2017-latest

  # Needs time to create SA user
  sleep 10
}

howToBuild() {
  if [ -n "${BUILD_MODE:-}" ]; then echo $BUILD_MODE; return; fi
  if [[ "$(uname)" == *Linux* ]]; then echo docker; return; fi
  echo native
}

buildWithDocker() {
  docker run --rm \
    -e ENVIRONMENT="local" \
    -v $(pwd):/root/synthetic-records \
    -v ~/.m2:/root/.m2 \
    -e NEXUS_USERNAME="${NEXUS_USERNAME}" \
    -e NEXUS_PASSWORD="${NEXUS_PASSWORD}" \
    --network host \
    vasdvp/health-apis-synthetic-records-builder:local \
    ./root/synthetic-records/build-on-mac.sh $@
}

buildNatively() {
  ENVIRONMENT=local ./build-on-mac.sh $@
}

loadDatabase() {
  if [ "$(howToBuild)" == "docker" ]
  then
    buildWithDocker $@
  else
    buildNatively $@
  fi
}

main $@
