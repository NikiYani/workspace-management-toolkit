#!/bin/bash

if [ $(id -u) -eq 0 ]; then
    egrep $1 /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$1 exists!"
		exit 1
	else
		cryptPass=$(perl -e 'print crypt($ARGV[0], "salt")' $2)
		useradd -m -G sudo -p $cryptPass -s /bin/bash $1
		[ $? -eq 0 ] && echo "User has been added to system" || echo "Failed to add a user!"
	fi
else
	echo "The script can only be run as root."
	exit 2
fi