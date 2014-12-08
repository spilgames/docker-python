#!/bin/sh

# This is the default run-script that should suffice for most applications. Applications using this runtime can override this by providing /app/run.sh.

if [ -x /app/run.sh ]; then
    /app/run.sh $@
    exit $?
fi

if [ -x /usr/bin/uwsgi ] && [ -r /app/settings.py ];
then
    # This is a standard Django + uWSGI container
    cd /app
    python ./manage.py migrate --noinput
    python ./manage.py collectstatic --noinput
    chown -R nobody:nobody /app/data
    /usr/bin/uwsgi --ini /app/uwsgi-django.conf
    exit $?
fi

# Open interactive python shell
python

