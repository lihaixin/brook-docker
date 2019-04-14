#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

if [ ! -f "$execfile" ]; then
	ln -s /usr/sbin/brook $execfile
fi

get_ip() {
	ip=$(curl -s https://ipinfo.io/ip)
	[[ -z $ip ]] && ip=$(curl -s https://api.ip.sb/ip)
	[[ -z $ip ]] && ip=$(curl -s https://api.ipify.org)
	[[ -z $ip ]] && ip=$(curl -s https://ip.seeip.org)
	[[ -z $ip ]] && ip=$(curl -s https://ifconfig.co/ip)
	[[ -z $ip ]] && ip=$(curl -s https://api.myip.com | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}")
	[[ -z $ip ]] && ip=$(curl -s icanhazip.com)
	[[ -z $ip ]] && ip=$(curl -s myip.ipip.net | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}")
	[[ -z $ip ]] && echo -e "\n$red 这垃圾小鸡扔了吧！$none\n" && exit
}

get_ip

echo
echo "---------- Brook 配置信息 -------------"
echo "地址 (Address) = ${ip}"
echo
echo "端口 (Port) = $serverport"
echo
echo "密码 (Password) = $password"
echo
echo "带宽（Bandwidch）= $RATE"
echo
echo "连接数（CONN）= $LIMIT_CONN"
echo
echo "给变量OPTIONS赋予-v开启调试模式"
echo
echo "---------- END -------------"
echo

#$execfile server --help
$execfile server --listen 0.0.0.0:${serverport} --password ${password} --tcpDeadline 0 $OPTIONS > /dev/sdtout 2>&1 &

iptables -F
iptables -A INPUT -p tcp -m state --state NEW --dport $serverport -m connlimit --connlimit-above $LIMIT_CONN -j DROP
tc qdisc add dev eth0 root tbf rate $RATE burst 100kb latency 50ms
watch -n 60 tc -s qdisc ls dev eth0
