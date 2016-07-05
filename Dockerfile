FROM nginx:alpine

MAINTAINER Marek Sirovy "msirovy@gmail.com"

ENV ETCDURL=""

RUN mkdir -p /etc/confd/{templates,conf.d}
COPY bashrc /etc/profile.d/
COPY confd /usr/local/bin/confd
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
COPY confd.toml /etc/confd/confd.toml
COPY ng-proxy.toml /etc/confd/conf.d/ng-proxy.toml
COPY ng-proxy.tmpl /etc/confd/conf.d/ng-proxy.toml
COPY start.sh /start.sh

CMD ["/start.sh"]
