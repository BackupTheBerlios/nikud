#!/bin/sh

if [ $# -ne 2 ]
then
  echo "Usage: `basename $0` <version number> (like 0.108.33) <babel version>"
  exit 1
fi

NIKUD_VERSION=$1
BABEL_VERSION=$2

if [ ${BABEL_VERSION} != "3.7" -a ${BABEL_VERSION} != "3.8" ] 
then
  echo "Babel version should be 3.7 or 3.8"
  exit 1
fi

NIKUD_FULL_NAME=nikud_for_babel_${BABEL_VERSION}-${NIKUD_VERSION}
NIKUD_TEXMF_FULL_NAME=nikud_texmf_for_babel_${BABEL_VERSION}-${NIKUD_VERSION}

if [ ${BABEL_VERSION} == "3.8" ]
then
    USE_BABEL_3_8="BABEL_3_8=1"
else
    USE_BABEL_3_8=""
fi

rm -fr tmp
cd nikud
make clean
cd ..
mkdir ${NIKUD_FULL_NAME}
#rm -fr out
mkdir out
cp -fr nikud/* ${NIKUD_FULL_NAME}/
cd ${NIKUD_FULL_NAME} && find . -iname CVS |xargs rm -fr && cd ..
tar -cjvf ${NIKUD_FULL_NAME}.tar.bz2 ${NIKUD_FULL_NAME}/
mv ${NIKUD_FULL_NAME}.tar.bz2 out/
rm -fr ~/texmf
cd ${NIKUD_FULL_NAME}/
make
make install ${USE_BABEL_3_8}
cd ..
pushd .
cd
tar -cjvf ${NIKUD_TEXMF_FULL_NAME}.tar.bz2 texmf/
popd
mv ~/${NIKUD_TEXMF_FULL_NAME}.tar.bz2 out
rm -fr tmp
rm -fr ${NIKUD_FULL_NAME}

./create_rpm.sh ${NIKUD_VERSION} ${BABEL_VERSION}

mv ./out/${NIKUD_FULL_NAME}.tar.bz2 ./out/nikud-${NIKUD_VERSION}.tar.bz2


echo ========================================================
echo If everything went well, products are in ./out directory
echo ========================================================
