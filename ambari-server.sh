cd /etc/yum.repos.d/
apt-get http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.2.1.0/ambari.repo
yum install ambari-server
ambari-server setup -j ambari-server setup -j /usr/java/latest/