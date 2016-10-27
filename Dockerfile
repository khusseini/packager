FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -y install \
        build-essential \
        autoconf \
        automake \
        wget \
        curl \
        python-pip \
        git && \
        pip2 install --user git+http://github.com/larsks/dockerize.git

ADD rootfs/ /

ENV PATH /root/.local/bin:$PATH

ENTRYPOINT ["/usr/bin/build-image"]
