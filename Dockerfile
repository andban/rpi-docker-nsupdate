FROM resin/raspberrypi-alpine:3.4

MAINTAINER Andreas Bannach <andreas@borntohula.de>

ENV NSUPDATE_REV c38db655ff5a83cf0d8b521969f5802f488a7d4d
ENV UPDATE_INTERVAL 12h

RUN apk --no-cache add \
    gawk \
    ca-certificates \
    curl \
    drill \
    unzip \
  && curl -sSL -o /tmp/nsupdate.zip  https://github.com/chrisb86/nsupdate/archive/c38db655ff5a83cf0d8b521969f5802f488a7d4d.zip \
  && unzip -j /tmp/nsupdate.zip -d /nsupdate \
  && chmod +x /nsupdate/nsupdate.sh

COPY nsupdate.d /nsupdate/nsupdate.d
COPY startup.sh /startup.sh

RUN chmod +x /startup.sh

CMD ["/startup.sh"]
