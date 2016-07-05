#FROM nginx:alpine
FROM nginx

MAINTAINER Marek Sirovy "msirovy@gmail.com"

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
	&& echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y vim-tiny \
	&& rm -rf /var/lib/apt/lists/* /etc/nginx/conf.d/*

ENV ETCD_NODES=""

RUN mkdir -p /etc/confd/{templates,conf.d}
COPY bashrc /root/.bashrc
COPY vim.tiny /etc/vim/vim.tiny
COPY vim.tiny /etc/vim/vim
COPY confd /usr/local/bin/confd
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
COPY confd.toml /etc/confd/confd.toml
COPY ng-proxy.toml /etc/confd/conf.d/ng-proxy.toml
COPY ng-proxy.tmpl /etc/confd/templates/ng-proxy.tmpl
COPY start.sh /start.sh

CMD ["/start.sh"]
