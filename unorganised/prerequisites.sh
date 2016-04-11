#!/bin/bash

echo check os version
cat /etc/issue

echo setup passwordless ssh login

echo save the existing firewall configurations
sudo iptables-save > /etc/sysconfig/iptables
echo disable firewall
sudo service iptables stop 
sudo chkconfig iptables off
echo Validate if firewall is disabled or not using the following command
sudo service iptables status

echo disble SELInux
sudo /usr/sbin/setenforce 0
sudo sed -i.old s/SELINUX=enforcing/SELINUX=disabled/ /etc/selinux/config
echo check status
sestatus



