#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

if [ ! -f "$execfile" ]; then
	ln -s /usr/sbin/brook $execfile
fi

$execfile server --help
$execfile server --listen ${serverlistenip}:${serverport} --password ${password} --tcpDeadline $tcpDeadline $OPTIONS > /dev/sdtout 2>&1 &

iptables -F
iptables -A INPUT -p tcp -m state --state NEW --dport $serverport -m connlimit --connlimit-above $LIMIT_CONN -j DROP
tc qdisc add dev eth0 root tbf rate $RATE burst $BURST latency $LATENCY
watch -n $INTERVAL tc -s qdisc ls dev eth0
