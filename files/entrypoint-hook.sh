#!/bin/sh

# This script is loaded as an entrypoint-hook. It runs before supervisord is started, so we can do some setup here.


if [ -r /app/settings.py ] && pip freeze |grep -i django >/dev/null 2>&1
then
    # This is a standard Django + uWSGI container
    cd /app
    python ./manage.py migrate --noinput
    python ./manage.py collectstatic --noinput
    chown -R nobody:nobody /app/data
    cp /configs/
fi


