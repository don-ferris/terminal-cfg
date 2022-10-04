SUBNET=`ip a | grep "inet " | tail -1 | awk '{print $2}'` && echo $SUBNET -
CUR_IP=$( echo $SUBNET | cut -d'/' -f 1 ) && echo $CUR_IP
exit
ROUTER=`ip route show | head -1 | awk '{print $3} ' ` && echo $ROUTER
SZ=`echo $SUBNET | awk -F / '{print $2}' ` && echo $SZ
BYTES=$(($SZ/8)) && echo $BYTES
PREFIX=`echo $SUBNET | cut -d. -f1-$BYTES` && echo $PREFIX
CUR_IP=`hostname -I | awk '{print $1} ' ` && echo $CUR_IP
echo -n "Keep current IP address? ($CUR_IP) [yn]> "
read KEEP
if [ $KEEP == "n" ]; then
  echo -n "Enter new IP address: "
  read NEW_IP
# check if specified IP is properly formatted
  if [[ ! $NEW_IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo Invalid IP
  fi
# check if specified IP works for local network
  if [[ ! $NEW_IP =~ ^$PREFIX ]]; then
    echo "ERROR: Specified IP not usable for local network "
    exit
  fi
fi
