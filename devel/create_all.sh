#!/bin/sh

if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` <version number> (like 0.108.33)"
  exit 1
fi

NIKUD_VERSION=$1

./create_distribution.sh ${NIKUD_VERSION} 3.7
./create_distribution.sh ${NIKUD_VERSION} 3.8
