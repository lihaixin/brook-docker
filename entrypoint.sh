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
	$execfile $protocol --listen ${serverlistenip} --password ${password} --tcpDeadline $tcpDeadline $OPTIONS
elif [[ ${protocol} == "client" ]]; then
	$execfile $protocol --help
	$execfile $protocol --listen $clientlistenip --ip $clientip  --server $serverlistenip  --password $password $OPTIONS  
elif [[ ${protocol} == "relay" ]]; then
	$execfile $protocol --help
        $execfile $protocol --listen $clientlistenip  --remote $serverlistenip $OPTIONS  
fi
