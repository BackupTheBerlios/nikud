#/bin/sh

if [ $# -ne 1 ]
then
  echo "Usage: `basename $0` <version number> (like 0.108.33)"
  exit 1
fi

# patch the template spec file and create the real spec file
echo %define version $1 > ./nikud_rpm.spec
cat ./nikud_rpm.spec.template >> ./nikud_rpm.spec

cp -f ./.rpmmacros ~/
rm -fr ~/rpms/
mkdir -p ~/rpms/nikud
mkdir -p ~/rpms/RPMS
mkdir -p ~/rpms/tmp

cp -f ./out/nikud-*.tar.bz2 ~/rpms/nikud/

rpmbuild -ba --target noarch nikud_rpm.spec
cp -f ~/rpms/RPMS/* ./out/

rm -f ./nikud_rpm.spec
rm -f ~/.rpmmacros
rm -fr ~/rpms/

