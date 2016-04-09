#!/bin/bash

#Java
java -version
rpm -qa | grep java
update-alternatives --config java

# Verifying Oracle JAVA installed Method in CentOS/Fedora/RHEL #
rpm -qa | grep jdk

yum info ambari-server

#jps
