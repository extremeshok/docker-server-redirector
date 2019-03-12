FROM extremeshok/baseimage-alpine:latest AS BUILD

LABEL mantainer="Adrian Kriel <admin@extremeshok.com>" vendor="eXtremeSHOK.com" com.example.version="1.0.3"

RUN echo "**** install haproxy ****" \
  && apk-install haproxy

RUN echo "**** install runtime packages ****" \
  && apk-install \
    bash \
    tzdata

# add local files
COPY rootfs/ /

### EMAIL
EXPOSE 25
EXPOSE 465
EXPOSE 587
EXPOSE 110
EXPOSE 995
EXPOSE 143
EXPOSE 993

### NNTP
EXPOSE 119
EXPOSE 563

### DNS
EXPOSE 53

### HTTP
EXPOSE 80
EXPOSE 8080
EXPOSE 443
EXPOSE 8443
EXPOSE 1080
EXPOSE 3128

### RSYNC
EXPOSE 873

### SQL
EXPOSE 3306
EXPOSE 5432
EXPOSE 4333

### Control Panels
EXPOSE 2082
EXPOSE 2083
EXPOSE 10000
EXPOSE 20000

WORKDIR /tmp

# https://www.haproxy.org/download/1.8/doc/management.txt
# "4. Stopping and restarting HAProxy"
# "when the SIGTERM signal is sent to the haproxy process, it immediately quits and all established connections are closed"
# "graceful stop is triggered when the SIGUSR1 signal is sent to the haproxy process"
STOPSIGNAL SIGUSR1

ENTRYPOINT ["/init"]
