#/bin/sh

if [ $# -ne 2 ]
then
  echo "Usage: `basename $0` <version number> (like 0.108.33) <babel version>"
  exit 1
fi

NIKUD_VERSION=$1
BABEL_VERSION=$2
NIKUD_FULL_NAME=nikud_for_babel_${BABEL_VERSION}

if [ ${BABEL_VERSION} != "3.7" -a ${BABEL_VERSION} != "3.8" ] 
then
  echo "Babel version should be 3.7 or 3.8"
  exit 1
fi


# patch the template spec file and create the real spec file
echo %define version ${NIKUD_VERSION} > ./nikud_rpm.spec
echo %define name ${NIKUD_FULL_NAME} >> ./nikud_rpm.spec
cat ./nikud_rpm_babel_${BABEL_VERSION}.spec.template >> ./nikud_rpm.spec

cp -f ./.rpmmacros ~/
rm -fr ~/rpms/
mkdir -p ~/rpms/${NIKUD_FULL_NAME}
mkdir -p ~/rpms/RPMS
mkdir -p ~/rpms/tmp

cp -f ./out/${NIKUD_FULL_NAME}-*.tar.bz2 ~/rpms/${NIKUD_FULL_NAME}/

rpmbuild -ba --target noarch nikud_rpm.spec
cp -f ~/rpms/RPMS/* ./out/

rm -f ./nikud_rpm.spec
rm -f ~/.rpmmacros
rm -fr ~/rpms/
