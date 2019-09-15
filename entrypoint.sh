#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
if [ ! -f "$execfile" ]; then
	mv /usr/sbin/brook $execfile
fi
sleep 2

$execfile client --help
$execfile $OPTIONS client --listen $clientlistenip --ip $clientip  --server $serverlistenip  --password $password > /dev/sdtout 2>&1 
