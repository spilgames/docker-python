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

# See if we can detect what we are supposed to run
if [ -r /app/src/requirements.txt ]; then
    if grep -i django /app/src/requirements.txt >/dev/null 2>&1;
    then
        echo
        echo "Django detected, installing manage.py and supervisor + uwsgi configs"
        echo "If this is not the desired behaviour, you can provide your own uwsgi configuration at /configs/uwsgi.ini, or disable uwsgi entirely by removing /etc/supervisord.d/uwsgi.ini"
        echo
        cp /build/manage.py /app/
        cp /build/uwsgi-django.ini /configs/uwsgi.ini
        cp /build/supervisor-uwsgi.ini /etc/supervisord.d/uwsgi.ini
    fi
fi

rm -rf /var/cache/yum/*
rm -rf /build
rm -rf /app/src

