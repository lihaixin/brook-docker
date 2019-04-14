FROM alpine:3.7

#RUN brook_new_ver=`wget -qO- https://github.com/txthinking/brook/tags| grep "/txthinking/brook/releases/tag/"| head -n 1| awk -F "/tag/" '{print $2}'| sed 's/\">//'` && \
ARG VERSION=v20190401
RUN apk add -U iproute2 && ln -s /usr/lib/tc /lib/tc
RUN  wget --no-check-certificate -O /usr/sbin/brook "https://github.com/txthinking/brook/releases/download/${VERSION}/brook" \
   && chmod +x /usr/sbin/brook

ENV execfile	/usr/sbin/httpd
ENV serverlistenip 0.0.0.0:61089
ENV clientlistenip 0.0.0.0:1080
ENV clientip	127.0.0.1
ENV password	pwd
ENV tcpDeadline	0
ENV OPTIONS	""


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
