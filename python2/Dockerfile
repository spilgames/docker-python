FROM spilgames/python-common

COPY files/ /build/

ONBUILD ADD . /app/src

ONBUILD RUN /build/build.sh python2

EXPOSE 8080

CMD /run.sh
