#!/bin/bash

#Java
java -version
rpm -qa | grep java


update-alternatives --config java

java-1.7.0-openjdk-1.7.0.71-2.5.3.2.el6_6.x86_64

# Verifying Oracle JAVA installed Method in CentOS/Fedora/RHEL #
rpm -qa | grep jdk

yum info ambari-server
