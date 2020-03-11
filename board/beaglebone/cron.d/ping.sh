#! /bin/sh

dns_list=$(awk '{print $2}' /etc/resolv.conf)
white_list="www.qq.com www.baidu.com"

check_ping()
{
	ping -c1 $1 &> /dev/null
	if [ $? -eq 0 ]; then
		return 0
	else
		return 1
	fi
}

check_list()
{
	for i in $*
		do
			check_ping $i
			if [ $? -eq 0 ]; then
				return 0
			fi
		done
	return 1	
}

check_list ${dns_list}

if [ $? -eq 0 ]; then
	check_list ${white_list}
	if [ $? -eq 0 ]; then
		exit 0
	fi
else
	exit 1
fi

exit 1




