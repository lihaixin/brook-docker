FROM alpine:3.7
LABEL name=brook
#RUN brook_new_ver=`wget -qO- https://github.com/txthinking/brook/tags| grep "/txthinking/brook/releases/tag/"| head -n 1| awk -F "/tag/" '{print $2}'| sed 's/\">//'` && \
ENV VERSION	v20180401
RUN apk add -U iproute2 && ln -s /usr/lib/tc /lib/tc
RUN  wget --no-check-certificate -O /usr/sbin/brook "https://github.com/txthinking/brook/releases/download/${VERSION}/brook" \
   && chmod +x /usr/sbin/brook

ENV execfile	/usr/sbin/httpd
ENV serverlistenip 0.0.0.0
ENV serverport 61089
ENV clientip	127.0.0.1
ENV password	pwd
ENV OPTIONS	""
ENV tcpDeadline	0

# ENV LIMIT_PORT 61089
ENV LIMIT_CONN 20
ENV RATE 10mbit
ENV BURST 100kb
ENV LATENCY 50ms
ENV INTERVAL 60

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

