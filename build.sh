#!/usr/bin/env bash

set -euo pipefail

cd $(readlink -f $(dirname $0))

#
# To support Jenkins use of the flyway container and because
# the flyway script provided in the flyway docker image isn't executable,
# we'll need to launch flyway via bash.
#
FLYWAY=flyway
if [ -f /flyway/flyway ]; then FLYWAY="bash /flyway/flyway"; fi

#
# To support local testing, add a local install to the front of the path
#
LOCAL_INSTALL=$(find -maxdepth 1 -name "flyway-6*" | sort -V | head -1)
if [ -n "$LOCAL_INSTALL" ]; then export PATH="$LOCAL_INSTALL:$PATH"; fi

#
# Load environment specific configuiration. See local.conf as an example
# of variables that need to be set.
#
echo "Loading configuration for ${ENVIRONMENT}"
case "${ENVIRONMENT}" in
  lab) . environments/lab.conf;;
  staging-lab) . environments/staging-lab.conf;;
  local) . environments/local.conf;;
  *) echo "Unknown environment: $ENVIRONMENT"; exit 1;;
esac

#
# These options are true through out the migration.
#
export FLYWAY_EDITION=community
export FLYWAY_DRIVER=com.microsoft.sqlserver.jdbc.SQLServerDriver
export FLYWAY_VALIDATE_ON_MIGRATE=true
export FLYWAY_BASELINE_ON_MIGRATE=true
export FLYWAY_BASELINE_VERSION=0.1
export FLYWAY_PLACEHOLDERS_DB_NAME=dq

announce() {
  echo "============================================================"
  echo "$1"
  echo "============================================================"
}

#
# To support local testing, if 'clean' supplied, then the existing
# database will be reset.
#
if [ "${1:-}" == "clean" ]
then
  announce "Cleaning database"
  FORCE_HACK="IF OBJECT_ID('[dbo].[flyway_schema_history_cleaner]','U') IS NOT NULL DELETE FROM [dbo].[flyway_schema_history_cleaner];"
  $FLYWAY migrate \
    -url="${FLYWAY_BASE_URL};databaseName=master" \
    -table=flyway_schema_history_cleaner \
    -locations='filesystem:db/destroyer' \
    -initSql="$FORCE_HACK"
fi


#
# Bootstrap the database
#
announce "Bootstrapping database"
$FLYWAY migrate \
    -url="${FLYWAY_BASE_URL};databaseName=master" \
    -table=flyway_schema_history \
    -locations='filesystem:db/bootstrap'

#
# Now apply migrations
#
announce "Migrating database"
$FLYWAY migrate \
    -url="${FLYWAY_BASE_URL};databaseName=$FLYWAY_PLACEHOLDERS_DB_NAME" \
    -table=flyway_schema_history \
    -locations='filesystem:db/migration' \
    -schemas=app

