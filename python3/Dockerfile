FROM spilgames/python-common

COPY files/ /build/

RUN /build/build.sh python3 3.4.2

ONBUILD ADD . /app/src

ONBUILD RUN /build/onbuild.sh python3

EXPOSE 8080
