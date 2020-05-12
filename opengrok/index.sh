#!/bin/sh
ROOT=/opengrok
DIST=/opengrok/dist
set +x
java -Djava.util.logging.config.file=$DIST/doc/logging.properties -jar $DIST/lib/opengrok.jar    -c /usr/local/bin/ctags  -s $ROOT/src -d $ROOT/data -H -P -S -G -W /opengrok/etc/configuration.xml -U http://localhost:8080/source -v
