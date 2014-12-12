#!/usr/bin/env bash
set -e
set -o pipefail

# Install PIP
curl -SL 'https://bootstrap.pypa.io/get-pip.py' | python

ls -la /build/

# Install uWSGI
yum install -y $(cat /build/builddeps)
pip install uwsgi
yum remove -y $(cat /build/builddeps)

# Create uWSGI user
useradd -rM  uwsgi

cp /build/entrypoint-hook.sh /scripts/entrypoint-hooks.d/python.sh

