# creates statically compiled shock-server binary: /go/bin/shock-server

FROM kbase/kb_minideb:jessie
MAINTAINER Steve Chan sychan@lbl.gov

ARG BUILD_DATE
ARG VCS_REF
ARG BRANCH=develop

RUN mkdir -p /kb/deployment/bin /kb/deployment/conf && \
    mkdir -p /mnt/awe/site /mnt/awe/data /mnt/awe/logs /mnt/awe/awfs

ADD deployment/ /kb/deployment

# The BUILD_DATE value seem to bust the docker cache when the timestamp changes, move to
# the end
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/kbase/AWE.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1" \
      us.kbase.vcs-branch=$BRANCH


