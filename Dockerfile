FROM alpine:latest

ARG USER
ARG PASSWORD

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --no-cache dante-server

RUN adduser -D $USER && echo "$USER:$PASSWORD" | chpasswd

ENV CFGFILE=/etc/sockd.conf \
    PIDFILE=/tmp/sockd.pid \
    WORKERS=10

COPY /sockd.conf /etc/sockd.conf

EXPOSE 1080

ENTRYPOINT sockd
CMD ["-f", $CFGFILE, "-p", $PIDFILE, "-N", $WORKERS]