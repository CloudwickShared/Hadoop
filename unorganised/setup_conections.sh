#!/bin/bash

# This script can setup all the nessesary settings for you to be ableto connect to the server.
# It takes as input the public server "<username>@openstack.cloudwick.com" followed by the private server you wish to connect to.
# Last it takes a port you wish to use for this conection (one you have not used yet)
USAGE="Usage $0 : <username>@openstack.cloudwick.com 172.16.x.x local_port remote_port\nExample: ./setup_conections.sh stanislav@openstack.cloudwick.com 172.16.0.126 2222 22"

if [ "$#" != "4" ]; then
        echo "$USAGE"
        exit 1
fi

intermediate_server="$1";
shift
remote_server="$1";
shift
local_port="$1";
shift
remote_port="$1";
shift

echo "Creating tunnel ${local_port}:${remote_server}:${remote_port} $intermediate_server"
ssh -fN -L ${local_port}:${remote_server}:${remote_port} $intermediate_server
