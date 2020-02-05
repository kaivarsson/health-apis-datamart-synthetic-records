#!/usr/bin/env bash

#
# This will export data from Mitre and replace the contents of the local
# ./src/test/resources/mitre database. It expects config/lab.properties to contain
# standard spring database configuration the source Mitre database.
#
exportLocalMitreDb() {
  cd $(dirname $0)

  LAB_PROPERTIES=config/lab.properties
  OUTPUT=./src/test/resources/mitre

  [ ! -f "$LAB_PROPERTIES" ] && echo "Missing $LAB_PROPERTIES" && exit 1

  for p in spring.datasource.username spring.datasource.password spring.datasource.url
  do
    ! grep -q "^$p=" $LAB_PROPERTIES && echo "Missing $p in $LAB_PROPERTIES" && exit 1
  done

  [ -f $OUTPUT.mv.db ] && rm -v $OUTPUT.*

  mvn \
    -P'!standard' \
    -Pmitre-export \
    generate-resources \
    -DconfigFile=config/lab.properties \
    -DoutputFile=./src/test/resources/mitre \
    -DexportPatients=32000225,43000199,17,23,1017283180V801730 \
    -Dorg.jboss.logging.provider=jdk \
    -Djava.util.logging.config.file=nope
}

openLocalMitreDb() {
  java -jar ~/.m2/repository/com/h2database/h2/1.4.200/h2-1.4.200.jar -url jdbc:h2:./src/test/resources/mitre -user sa -password sa  
}

# ============================================================

usage() {
  cat <<EOF
$0 <command>

Commands:
  export     Make a copy of db in a local h2 database (/src/test/resources/mitre.*)
  open       Open the local mitre database (/src/test/resources/mitre.mv.db)

EOF
exit
}

case $1 in
  export) exportLocalMitreDb;;
  open) openLocalMitreDb;;
  *) usage;;
esac
