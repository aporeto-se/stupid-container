FROM fedora:31
WORKDIR /
MAINTAINER jodyscott

RUN dnf -y update
RUN dnf -y install bind-utils jq net-tools procps iproute

ADD stupid-curl /usr/bin/stupid-curl
RUN chmod +x /usr/bin/stupid-curl

RUN curl -L -o /usr/sbin/stupid-http https://github.com/jodydadescott/stupid-httpd/releases/download/v1-linux/stupid-http
RUN chmod +x /usr/sbin/stupid-http

ADD entrypoint.sh /
RUN chmod 755 /entrypoint.sh

ADD cache/kubectl /usr/bin/kubectl
RUN chmod 755 /usr/bin/kubectl

CMD ["/entrypoint.sh"]
