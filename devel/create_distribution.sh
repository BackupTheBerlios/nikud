#!/bin/sh

rm -fr tmp
cd nikud
make clean
cd ..
mkdir nikud_source
mkdir out
cp -fr nikud/* nikud_source/
cd nikud_source
find . -iname CVS |xargs rm -fr
cd ..
tar -cjvf nikud_source.tar.bz2 nikud_source/
mv nikud_source.tar.bz2 out/
rm -fr ~/texmf
cd nikud_source/
make
make install
cd ..
pushd .
cd
mv texmf nikud_texmf
tar -cjvf nikud_texmf.tar.bz2 nikud_texmf/
popd
mv ~/nikud_texmf.tar.bz2 out
rm -fr tmp
rm -fr nikud_source
