#!/bin/sh

rm -fr tmp
cd nikud
make clean
cd ..
mkdir nikud_source_$1
rm -fr out
mkdir out
cp -fr nikud/* nikud_source_$1/
cd nikud_source_$1 && find . -iname CVS |xargs rm -fr && cd ..
tar -cjvf nikud_source_$1.tar.bz2 nikud_source_$1/
mv nikud_source_$1.tar.bz2 out/
rm -fr ~/texmf
cd nikud_source_$1/
make
make install
cd ..
pushd .
cd
mv texmf nikud_texmf_$1
tar -cjvf nikud_texmf_$1.tar.bz2 nikud_texmf_$1/
popd
mv ~/nikud_texmf_$1.tar.bz2 out
rm -fr tmp
rm -fr nikud_source_$1
