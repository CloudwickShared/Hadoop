#!/bin/bash

#call mysql configuration script
./mysql_config.sh

#install java
./java_install.sh

#call installation of ambari server
./ambari_server_config.sh

