FROM alpine:3.8

#RUN brook_new_ver=`wget -qO- https://github.com/txthinking/brook/tags| grep "/txthinking/brook/releases/tag/"| head -n 1| awk -F "/tag/" '{print $2}'| sed 's/\">//'` && \
ARG VERSION=v20190601
ENV TZ=Asia/Shanghai
# RUN apk add -U iproute2 tzdata && ln -s /usr/lib/tc /lib/tc
RUN  apk add -U tzdata \
     && wget --no-check-certificate -O /usr/sbin/brook "https://github.com/txthinking/brook/releases/download/${VERSION}/brook" \
     && chmod +x /usr/sbin/brook

ENV execfile=/usr/sbin/httpd
ENV serverlistenip=0.0.0.0:61089
ENV clientlistenip=0.0.0.0:1080
ENV clientip=127.0.0.1
ENV password=pwd
ENV tcpDeadline=0
ENV OPTIONS="-d"


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
