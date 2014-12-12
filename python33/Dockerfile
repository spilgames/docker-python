FROM spilgames/python-common

COPY files/ /build/

RUN yum install -y https://www.softwarecollections.org/en/scls/rhscl/python33/epel-7-x86_64/download/rhscl-python33-epel-7-x86_64.noarch.rpm \
    && yum install -y python33

ONBUILD ADD . /app/src

ONBUILD RUN /build/build.sh python2

EXPOSE 8080

CMD /run.sh
