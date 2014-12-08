#!/usr/bin/env bash
set -e
set -o pipefail

mkdir -p /app/{data,src,static}

mkdir -p /app/src
mkdir -p /app/static
yum install -y $(cat /build/builddeps*)
curl -SL 'https://bootstrap.pypa.io/get-pip.py' | python
[ -r /app/src/requirements.txt ] && pip install -r /app/src/requirements.txt
[ -r /app/src/setup.py ] && cd /app/src && python setup.py install
yum remove -y $(cat /build/builddeps*) *-devel
cp /build/run.sh /run.sh
chmod +x /run.sh
cp /build/manage.py /app/
cp /build/uwsgi-django.conf /app/uwsgi-django.conf
rm -rf /var/cache/yum/*
rm -rf /build
rm -rf /app/src

