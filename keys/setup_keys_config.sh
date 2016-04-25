#!/bin/bash

if [[ $# -ne "6" ]]; then
	echo "Use ths script as \"$0 ID_file user_name user_email remote_host remote_ost_name log_file\":\n$0  ~/.ssh/master_key stanislav stanislav@email.com 172.27.141.78 ambari log_file"
	exit 1;
fi

identity_file=$1
shift; user_name=$1
shift; user_email=$1
shift; remote_host=$1
shift; remote_host_name=$1
shift; log_file=$1


file_name=$(basename "${identity_file}")
extension="${file_name##*.}"
file_name="${file_name%.*}"
dir_name=$(dirname "${identity_file}")

mkdir -p "~/.ssh/"

echo "Host ${remote_host_name}"\n\tUser ${user_name}\n\tHostname ${remote_host}\n\tIdentityfile ${identity_file} >> "~/.ssh/config"
