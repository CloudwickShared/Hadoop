#!/bin/bash
# Simple setup.sh for configuring CentOS6 and Hadoop

$log="my_log"


yum -y update > $log

yum -y install wget >> $log
res="$?"; goal="wget"
if [[ $res -eq 0 ]]; then echo "installed successfully: ${goal}"; else echo "Failed to install: ${goal}"; exit 1; fi;

yum -y install unzip >> $log
res=$? ; goal="unzip"
if [[ $res -eq 0 ]]; then echo "installed successfully: ${goal}"; else echo "Failed to install: ${goal}"; exit 1; fi;

yum -y install curl >> $log
res=$? ; goal="curl"
if [[ $res -eq 0 ]]; then echo "installed successfully: ${goal}"; else echo "Failed to install: ${goal}"; exit 1; fi;

yum -y install tar >> $log
res=$? ; goal="tar"


service iptables stop
chkconfig iptables off
service ip6tables stop
chkconfig ip6tables off

echo "disabled Ipv6 tables"

sysctl -w vm.swappiness=0
echo 0 > /proc/sys/vm/swappiness

if grep -q "echo 0 > /proc/sys/vm/swappiness" /etc/rc.local
	then echo " Swapp is disabled on boot"
	else echo "echo 0 > /proc/sys/vm/swappiness" >> /etc/rc.local
	echo "Disabling swap on boot"
fi

ulimit -n 16000


if grep -q "ulimit -n 16000" /etc/rc.local
	then echo " ulimit was already set to 16000"
	else echo "ulimit -n 16000" >> /etc/rc.local
	echo "ulimit set to 16000 on the boot"
fi

yum -y install ntp
ntpdate 0.centos.pool.ntp.org
service ntpd start
chkconfig ntpd on
ntpstat

echo "ntpd is running and enabled on boot"

yum -y upgrade openssl

echo "openSSL updated"

sed -i.old s/SELINUX=enforcing/SELINUX=disabled/ /etc/selinux/config
echo 0 > /selinux/enforce

echo "SELinux disabled"

echo never > /sys/kernel/mm/transparent_hugepage/enabled

if grep -q "echo never > /sys/kernel/mm/transparent_hugepage/enabled" /etc/rc.local
	then echo "Transparent Hugepage disabled on boot"
	else echo "echo never > /sys/kernel/mm/transparent_hugepage/enabled" >> /etc/rc.local
	echo "Disabling Transparent Hugepage on boot"
fi


# cat hosts.list>> /etc/hosts
# echo "Update the /etc/hosts"

cd /opt

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.rpm -O jdk-8u77-linux-x64.rpm

echo "downloaded java"
rpm -ivh jdk-8u77-linux-x64.rpm

echo "installed java"
alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_77/bin/java 200000

wget -nv http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.1.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

echo "downloaded ambari.repo"

yum -y install mysql-connector-java
echo "installed mysql connector to java"


yum -y install ambari-agent


echo "ambari-agent is installed"

sed -i.old -e 's/hostname=localhost/hostname=ambari.cloudwick.com/' /etc/ambari-agent/conf/ambari-agent.ini

echo "ambari-agent is configured"

echo " prerequisites are installed"
