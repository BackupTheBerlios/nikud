#!/bin/sh

# rpm post uninstall for nikud package
# remove the line 'p +culmus.map' from the file config.ps

CONFIG_PS_FILE=`kpsewhich --format="dvips config" config.ps`
CONFIG_TMP=configpstmp.tmp

grep -v "culmus.map" $CONFIG_PS_FILE > $CONFIG_TMP
cp -f $CONFIG_TMP $CONFIG_PS_FILE
rm -f $CONFIG_TMP
mktexlsr
