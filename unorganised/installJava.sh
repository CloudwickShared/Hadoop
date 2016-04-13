#!/bin/sh
echo "Installing Java !!!"
cd /opt

#download java

wget --no-check-certificate \
     --no-cookies \
     --header "Cookie: oraclelicense=accept-securebackup-cookie" \
     http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.rpm \
     -O jdk-8u51-linux-x64.rpm

#install java

rpm -ivh jdk-8u51-linux-x64.rpm

#Select the java

alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_51/bin/java 200000
