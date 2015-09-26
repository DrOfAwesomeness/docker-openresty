FROM ubuntu:trusty
RUN apt-get update
RUN apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev \
    libssl-dev perl make build-essential libluajit-5.1-dev libgeoip-dev
ADD ngx_openresty-1.9.3.1.tar.gz /usr/src
RUN ls /usr/src -l

WORKDIR /usr/src/ngx_openresty-1.9.3.1
RUN ./configure --prefix=/usr --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --user=nginx --group=nginx --with-luajit --with-http_stub_status_module --with-http_geoip_module --with-http_realip_module --with-http_secure_link_module
RUN make
RUN make install
ADD entrypoint.sh /

ENTRYPOINT /entrypoint.sh
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
