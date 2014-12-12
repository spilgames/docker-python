FROM spilgames/python-common

COPY files/ /build/

RUN /build/build.sh python2

ONBUILD ADD . /app/src

ONBUILD RUN /build/onbuild.sh python2

EXPOSE 8080

