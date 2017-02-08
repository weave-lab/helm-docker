FROM google/cloud-sdk

MAINTAINER Clint Berry <clint@getweave.com>

ENV VERSION v2.1.3
ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz

WORKDIR /

ADD https://kubernetes-helm.storage.googleapis.com/${FILENAME} /tmp

RUN tar -zxvf /tmp/${FILENAME} -C /tmp \
  && mv /tmp/linux-amd64/helm /bin/helm \
  && rm -rf /tmp
