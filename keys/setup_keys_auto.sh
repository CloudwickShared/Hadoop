#! /bin/bash

if [[ $# -ne 2 ]]; then
	echo -e "You need to provide a settings file and what you will run:\n$0 settings.yml setup_keys_servers.sh"
	exit 1;
fi

settings_file=$1
shift;run_file=$1

grep -v "^\#" ${settings_file} |\
	awk -v run="$run_file" 'BEGIN { FS = ":" } ; {\
	print run,\
	$7, $5, "stanislav@email.com", $2, $6 , "log_file" }'
	#./setup_keys.sh master1_key_rsa   root          stanislav@email.com    172.16.5.108                  log_file
	#                ID_file          user_name       user_email            remote_host    remote_ost_name log_file
