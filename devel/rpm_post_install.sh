#!/bin/sh

# rpm post install for nikud package
# insert the line 'p +culmus.map' into the file config.ps

CONFIG_PS_FILE=`kpsewhich --format="dvips config" config.ps`
CONFIG_TMP=configpstmp.txt

grep -v "culmus.map" $CONFIG_PS_FILE > $CONFIG_TMP
echo "p +culmus.map" >> $CONFIG_TMP
cp -f $CONFIG_TMP $CONFIG_PS_FILE
rm -f $CONFIG_TMP
mktexlsr
