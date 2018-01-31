#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
if [ ! -f "$execfile" ]; then
	mv /usr/sbin/brook $execfile
fi
sleep 2
$execfile --help
if [[ ${protocol} == "server" ]]; then
	$execfile $protocol --help
	$execfile $protocol --listen ${serverlistenip} --password ${password} --tcpDeadline $tcpDeadline $OPTIONS > /dev/sdtout 2 >&1 &
        iptables -F \
        && iptables -A INPUT -p tcp -m state --state NEW --dport $LIMIT_PORT -m connlimit --connlimit-above $LIMIT_CONN -j DROP \
        && tc qdisc add dev eth0 root tbf rate $RATE burst $BURST latency $LATENCY \
        && watch -n $INTERVAL tc -s qdisc ls dev eth0

elif [[ ${protocol} == "client" ]]; then
	$execfile $protocol --help
	$execfile $protocol --listen $clientlistenip --ip $clientip  --server $serverlistenip  --password $password $OPTIONS  
elif [[ ${protocol} == "relay" ]]; then
	$execfile $protocol --help
        $execfile $protocol --listen $clientlistenip  --remote $serverlistenip $OPTIONS  
fi
