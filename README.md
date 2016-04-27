# Hadoop Cluster Setup

This is an attempt to automate Hadoop installation.

## Quick Guide

There are five stages in the set up at present. The instructions reflect the current state of master, and should be updated as scripts mature and become more comprehensive.

1. Edit the settings.yml file with the details of your cluster
1. Set up your own machine with an ssh key and tranfer it to all nodes
   1. The script is not in master yet,  use `ssh-keygen` and `ssh-copy-id`
1. Use ssh to run the prerequisites script on each node
   1. `ssh root@node.ip.address 'bash -s' < install_prerequisites.sh`
1. Use ssh to run the ambari-server script on the ambari server node
   1. This script is also in progress... for now follow the documentation
1. Log into ambari server with your browser to assign services to the nodes
   1. Set up a tunnel with `ssh 8080:<ambari-server-IP>:8080 <username>@openstack.cloudwick.com`
   1. Go to `http://localhost:8080` in the browser and log in as admin/admin

## Project Structure
