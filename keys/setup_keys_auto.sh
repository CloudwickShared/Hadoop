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
	$6 , $7, "stanislav@email.com", $2, $5, "log_file" }'

