#!/bin/sh

if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` <version number> (like 0.108.33)"
  exit 1
fi

rm -fr tmp
cd nikud
make clean
cd ..
mkdir nikud-$1
rm -fr out
mkdir out
cp -fr nikud/* nikud-$1/
cd nikud-$1 && find . -iname CVS |xargs rm -fr && cd ..
tar -cjvf nikud-$1.tar.bz2 nikud-$1/
mv nikud-$1.tar.bz2 out/
rm -fr ~/texmf
cd nikud-$1/
make
make install
cd ..
pushd .
cd
tar -cjvf nikud_texmf-$1.tar.bz2 texmf/
popd
mv ~/nikud_texmf-$1.tar.bz2 out
rm -fr tmp
rm -fr nikud-$1

./create_rpm.sh $1

echo ========================================================
echo If everything went well, products are in ./out directory
echo ========================================================
