#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
RESET="\e[0m"
CREDS=./creds

if [ "$EUID" -ne 0 ]; then
	echo -e "$RED[-]$RESET run as root!"
	exit
fi

if ! test -f  "$CREDS"; then
	echo -e "$RED[-]$RESET $CREDS doesnt exists!"
	exit
fi

CREDS=`cat $CREDS`
CREDS_LIST=( $CREDS )
USERNAME=${CREDS_LIST[0]}
PASS=${CREDS_LIST[1]}

mkdir /howtoproxy
echo "#!/bin/bash"                                                                > /howtoproxy/start.sh
echo "sshpass -p $PASS ssh -o GatewayPorts=true -N -D 6969 $USERNAME@127.0.0.1"   >> /howtoproxy/start.sh
chmod +x /howtoproxy/start.sh

echo -e "$GREEN[+]$RESET setup completed"