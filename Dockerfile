#FROM google/cloud-sdk
FROM alpine:3.6

MAINTAINER Clint Berry <clint@getweave.com>

ARG HELM_VERSION=v2.4.2
ARG HELM_PKG=helm-${HELM_VERSION}-linux-amd64.tar.gz
ARG HELM_URL=https://storage.googleapis.com/kubernetes-helm/${HELM_PKG}

ARG KUBECTL_VERSION=v1.6.6
ARG KUBECTL_URL=https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl


RUN apk add --no-cache --virtual .build-deps curl tar \
 && echo ${HELM_URL} \
 && curl -sSL ${HELM_URL} | tar xzf - --strip-components=1 -C /usr/bin \
 && curl -sSL $KUBECTL_URL -o /usr/bin/kubectl \
 && chmod +x /usr/bin/kubectl \
 && apk del --no-cache .build-deps
