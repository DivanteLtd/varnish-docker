FROM alpine:latest

MAINTAINER Mateusz Koszutowski <mkoszutowski@divante.pl>

RUN apk update \
    && apk upgrade

RUN apk --update add \
        varnish \
        bash

COPY config/default.vcl /etc/varnish/default.vcl

EXPOSE 80 6082

CMD ["varnishd", "-F", "-a", ":80", "-T", ":6082", "-f", "/etc/varnish/default.vcl", "-s", "malloc,256m"]