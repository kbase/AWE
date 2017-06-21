#!/bin/bash

# Simpler entrypoint script for awe client
# This should now be in the kbase_base:auth2 image

clientgroup=$1
vmhostname=$2

echo clientgroup is $clientgroup
echo vmhostname is $vmhostname

containername=$(docker inspect $(hostname)|grep aweworker|grep Name|cut -f2 -d '/'|cut -f1 -d '"')

clientname=${clientgroup}_${vmhostname}_${containername}

/kb/deployment/bin/awe-client --conf /kb/deployment/awe-client.cfg --name=$clientname --data=/mnt/awe/$clientgroup/$clientname/data --logs=
/mnt/awe/$clientgroup/$clientname/logs --workpath=/mnt/awe/$clientgroup/$clientname/work --group=$clientgroup --clientgroup_token=$(cat /co
nfig/config/$clientgroup.token)
