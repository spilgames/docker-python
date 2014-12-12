#!/usr/bin/env bash
set -e
set -o pipefail
set -x

if [ -n "$1" ]
then
    python=$1
else
    python=python
fi

# Install build dependencies
yum install -y $(cat /build/builddeps)

# See if we have a version specific build script
if [ -n "$1" ] && [ -x /build/build-$1.sh ];
then
    /build/build-$1.sh $2
fi

# Install PIP
curl -SL 'https://bootstrap.pypa.io/get-pip.py' | $python

# Install uwsgi
pip install uwsgi

# Remove build dependencies
yum remove -y $(cat /build/builddeps)

# Create uWSGI user
useradd -rM  uwsgi

cp /build/entrypoint-hook.sh /scripts/entrypoint-hooks.d/python.sh

