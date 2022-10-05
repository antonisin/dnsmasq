FROM alpine:latest

MAINTAINER Maxim Antonisin <maxim.antonisin@gmail.com>

RUN apk update
RUN apk add dnsmasq

EXPOSE 53
EXPOSE 53/udp

CMD ["/usr/sbin/dnsmasq", "-d"]