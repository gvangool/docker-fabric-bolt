FROM centos:7
MAINTAINER Gert Van Gool <gert@vangool.mx>

RUN yum install -y epel-release && \
    yum update -y && \
    yum clean all

RUN yum install -y python{,-devel} gcc libxml2{,-devel} libxslt{,-devel} git && \
    yum clean all && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm -f get-pip.py

ENV PIP_NO_CACHE_DIR "off"

ENV REPO https://github.com/fabric-bolt/fabric-bolt.git
ENV VERSION 03613fa90db193f603cc09cb778fe0fcce9a7db7

RUN mkdir -p /src && \
    git clone ${REPO} /src/fabric-bolt && \
    cd /src/fabric-bolt && \
    git checkout ${VERSION} && \
    pip install -e .
