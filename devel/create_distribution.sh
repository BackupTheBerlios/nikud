#!/bin/sh

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
