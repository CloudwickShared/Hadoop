#!/bin/bash
#This script calls other scripts in order to make a master node configuration

#call mysql configuration script
./mysql_config.sh

#install java
./java_install.sh

#call installation of ambari server
./ambari_server_config.sh

