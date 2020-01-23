FROM alpine:3.8
ENV awscli_ver="1.16.290" s3cmd_ver="2.0.2"

RUN apk -v --update add \
    python \
    py-pip \
    groff \
    less \
    mailcap \
    && \
    pip install --upgrade awscli==${awscli_ver} s3cmd==${s3cmd_ver} python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
