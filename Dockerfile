FROM google/cloud-sdk

MAINTAINER Trevor Hartman <trevorhartman@gmail.com>

ENV VERSION v2.0.0-alpha.4
ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz

WORKDIR /

ADD https://github.com/kubernetes/helm/releases/download/${VERSION}/${FILENAME} /tmp


RUN tar -zxvf /tmp/${FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp
