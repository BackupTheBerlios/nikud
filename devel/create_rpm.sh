#/bin/sh

NEWROOT=~/crust_newroot
VERSION=0.100
RELEASE=1

rm -fr $NEWROOT
mkdir -p $NEWROOT

crust --init --copy $NEWROOT
cp out/nikud-$VERSION.tar.bz2 $NEWROOT/build
pushd .
cd $NEWROOT/build
tar -xjvf nikud-$VERSION.tar.bz2
cd nikud-$VERSION
make -f Makefile.crust
popd
sudo /usr/sbin/chroot $NEWROOT make -C /build/nikud-$VERSION -f /build/nikud-$VERSION/Makefile.crust install
sudo chown -R itai $NEWROOT
crust --makerpm --name nikud --version $VERSION --release $RELEASE --group Publishing --license "GNU GPL" --sum "Hebrew Culmus fonts in LaTeX with Nikud" --desc "Use Hebrew Culmus fonts in LaTeX with Hebrew vowel-points" --post /home/itai/nikud_devel/devel/rpm_post_install.sh --postun /home/itai/nikud_devel/devel/rpm_post_uninstall.sh $NEWROOT