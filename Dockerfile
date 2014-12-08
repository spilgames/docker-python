FROM centos:latest

COPY files/ /build/

RUN chmod +x /build/*.sh

