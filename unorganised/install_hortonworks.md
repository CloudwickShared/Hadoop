## Installation of Server

### PreRequisites

1. Open Git Bash

2. Enter into the gateway by __ssh bhavin@openstack.cloudwick.com__, then password: _Cloudw!ck_

3. Enter into server by __ssh root@172.16.0.132__, then password: hadoop123

4. Check if we are using correct OS
  * _cat /etc/issue_

5. Check common Prerequisites
  * Firewall
    * Save present firewall configuration by `sudo iptables-save > /etc/sysconfig/iptables`
    * Stop firewall: `sudo service iptables stop` & `sudo chkconfig iptables off`
    * Check if firewall disable `sudo service iptables status`
    * Disable SELinux `sudo /usr/sbin/setenforce 0`
      `sudo sed -i.old s/SELINUX=enforcing/SELINUX=disabled/ /etc/selinux/config`
    * To check status `setstatus`
    * Set hostname `sudo hostname [ ... ]`
    * Validate username: `uname -a`
    * Check config: `/sbin/ifconfig`
    * Install NTP: `yum install ntp`, update NTP: `ntpupdate [ntp_server]`, Start ntpd: `service ntpd start`
    * To start ntp at boot: `chkconfig ntpd on  

6. Check if we can mount device
  * `lsblk`

7. Check if transparent huge pages
  * `cat /proc/sys/vm/nr_hugepages` output should be __0__

8. Install Java
  * `cd opt`
  * `wget --no-check-certificate \
     --no-cookies \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.rpm \
     -O jdk-7u79-linux-x64.rpm`
  * `rpm -ivh jdk-7u79-linux-x64.rpm`
  * `alternatives --install /usr/bin/java java /usr/java/jdk1.7.0_79/bin/java 200000`

9. Install MySql
  * `yum install mysql-server`
  *  To check status of mysql: `service mysqld status`
  * `service mysqld start` to start the mysqld

###Installation

1. Mysql-connector
  * `yum install mysql-connector-java`

2. Download Ambari
  * `cd /etc/yum.repos.d/`
  * `wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.1.0/ambari.repo`

3. Start mysql
  * `mysql -u root -p`, press enter and no password

4. Create database
  1. Hive
```mysql
CREATE USER 'hive'@'master2.cloudwick.com' IDENTIFIED BY 'hive';
GRANT ALL PRIVILEGES ON *.* TO 'hive'@'master2.cloudwick.com' with grant option;
CREATE USER 'hive'@'%' IDENTIFIED BY 'hive';
GRANT ALL PRIVILEGES ON *.* TO 'hive'@'%' with grant option;
CREATE USER 'hive'@'master2.cloudwick.com' IDENTIFIED BY
'hive';
GRANT ALL PRIVILEGES ON *.* TO 'hive'@'master2.cloudwick.com' with grant option; 
```

  2. Ambari
```mysql
CREATE USER 'ambari'@'master2.cloudwick.com' IDENTIFIED BY 'ambari';
GRANT ALL PRIVILEGES ON *.* TO 'ambari'@'master2.cloudwick.com' with grant option;
CREATE USER 'ambari'@'%' IDENTIFIED BY 'ambari';
GRANT ALL PRIVILEGES ON *.* TO 'ambari'@'%' with grant option;
CREATE USER 'ambari'@'master2.cloudwick.com' IDENTIFIED BY
'ambari';
GRANT ALL PRIVILEGES ON *.* TO 'ambari'@'master2.cloudwick.com' with grant option; 
```

  3. Oozie
```mysql
CREATE USER 'oozie'@'master2.cloudwick.com' IDENTIFIED BY 'oozie';
GRANT ALL PRIVILEGES ON *.* TO 'oozie'@'master2.cloudwick.com' with grant option;
CREATE USER 'oozie'@'%' IDENTIFIED BY 'oozie';
GRANT ALL PRIVILEGES ON *.* TO 'oozie'@'%' with grant option;
CREATE USER 'oozie'@'master2.cloudwick.com' IDENTIFIED BY
'oozie';
GRANT ALL PRIVILEGES ON *.* TO 'oozie'@'master2.cloudwick.com' with grant option;
```

5. Install Ambari 
  * `yum install ambari-server`
  * `yum install ambari-agent`
  * `ambari-server setup`, select custom jdk and select java path ; this also install new JDK, you can use previously installed JDK by
	'ambari-server setup -j /usr/java/latest/`

6. Select Mysql as database
  * `mysql -u ambari -p`, Press enter with no password
  * Create database
```mysql
create database ambari;
use ambari;
source /var/lib/ambari-server/resources/Ambari-DDL-MySQL-CREATE.sql;
'''

7. Start ambari server
  * `sudo service ambari-server start`





### Miscellaneous

we set hostname in: /etc/sysconfig/network

we add hosts in: /etc/hosts

Normal copy: `CP oldfile newfile`

To Secure copy-  `SCP user@host:oldfile user@host:newfile`
