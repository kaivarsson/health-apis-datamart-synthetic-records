#!/usr/bin/env bash

#
# Uses mitre-minimart-maker.sh to transform all resources for a given patient to datamart
#

SD=$(readlink -f $(dirname $0))

echo "Script Directory: $SD"

cd "$SD"

FHIR_RESOURCES=$(readlink -f ../health-apis-data-query/data-query-tests)

echo "Fhir Resources: $FHIR_RESOURCES"

cd "$FHIR_RESOURCES"

PATIENT="$1"
RESOURCES="AllergyIntolerance Condition DiagnosticReport Immunization"
# Medication MedicationOrder MedicationStatement Observation Patient Procedure"

for resource in $RESOURCES
do
  echo "Transforming To Datamart for Resource: $resource"
  ./mitre-minimart-maker.sh transformToDatamart -d "$SD/fhir/lab-crawl-$PATIENT" -r "$resource"
done

echo "Copying files to Synthetic Records Repo..."

[ ! -d "$SD/datamart/dm-records-$PATIENT/" ] && mkdir "$SD/datamart/dm-records-$PATIENT/"

cp $FHIR_RESOURCES/target/fhir-to-datamart-samples/* "$SD/datamart/dm-records-$PATIENT/"

rm -r "$FHIR_RESOURCES/target/fhir-to-datamart-samples/"

cd "$SD"
