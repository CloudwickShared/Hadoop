#! /bin/bash

## Requirements: a proxy server
# to create a proxy server
# install squid with : `sudo yum install squid` or `sudo apt-get install squit3`
# Edit the conf file:
# vi /etc/squid/squid.conf after the line:
#	INSERT YOUR OWN RULE(S) HERE TO ALLOW ACCESS FROM YOUR CLIENTS
#       acl local_net src <your_ip_address>/255.255.255.0
#       http_access allow local_net


## Process

## Modify: the parameters bellow 
# username
# password
# proxy_server

## Run:
# source <filename.sh>
# setproxy or unsetproxy


# Set Proxy
function setproxy() {
	username=<username>
	password=<password>
	proxy_server=<proxy_server>
	port=3128
	export {http,https,ftp}_proxy="http://${username}:${password}@${proxy_server}:${port}"
}

# Unset Proxy
function unsetproxy() {
	unset {http,https,ftp}_proxy
}
