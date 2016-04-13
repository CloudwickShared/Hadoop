#!/bin/bash
# This script creates the host table
# Example of expected format : 
# This file contains internal IPs and desired hostnames for each node
# 10.2.1.165 ambari.cloudwick.com
# 10.2.1.166 master1.cloudwick.com
# 10.2.1.156 master2.cloudwick.com
# 10.2.1.97 data1.cloudwick.com
# 10.2.1.93 data2.cloudwick.com
echo "# This file contains internal IPs and desired hostnames for each node" > hosts.list 
cut -d: -f1,4 settings.yml |grep -v ^#| sed -e "s/:/\t/" >>  hosts.list
