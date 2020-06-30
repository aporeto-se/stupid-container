FROM alpine:latest
WORKDIR /
MAINTAINER jodyscott

RUN apk update
RUN apk add bash curl bind-tools

ADD stupid-curl /usr/bin/stupid-curl
RUN chmod +x /usr/bin/stupid-curl

RUN curl -L -o /usr/sbin/stupid-http https://github.com/jodydadescott/stupid-httpd/releases/download/v1-linux/stupid-http
RUN chmod +x /usr/sbin/stupid-http

ADD entrypoint.sh /
RUN chmod 755 /entrypoint.sh

CMD ["/entrypoint.sh"]
