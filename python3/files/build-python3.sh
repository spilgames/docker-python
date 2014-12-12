#!/usr/bin/env bash
set -e
set -x
set -o pipefail

version=$1
olddir=$PWD

if [ -z "${version}" ];
then
    echo "No python3 version to build specified"
    exit 1
fi

mkdir -p /build/src
cd /build/src
wget https://www.python.org/ftp/python/${version}/Python-${version}.tgz
tar zxf Python-${version}.tgz
cd Python-${version}
./configure --enable-shared --prefix=/usr
make -j4
make install
ldconfig
ln -s /usr/bin/pip3 /usr/bin/pip
cd $olddir
rm -rf /build/src

