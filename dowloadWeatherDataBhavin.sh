#!/bin/bash

# global parameter
tmp_folder="tmpData";
output_folder="outData";

# Download data function

function downloadData {
    echo $1
    local source="ftp://ftp.ncdc.noaa.gov/pub/data/gsod/$1/gsod_$1.tar"
    wget -nc -q -P "$tmp_folder" "$source"
}

# Processing data

function processData {
    local file="$tmp_folder/gsod_$1.tar"
    chmod 777 "$file"
    tar -xf "$file" -C $tmp_folder/
    rm $file
    tmp_out_file="$output_folder/$1"
    firstLine=true
    for f in $tmp_folder/*;
    do
      if [ "$firstLine" = true ] ; then
        gunzip -q -c $f >> "$tmp_out_file"
        firstLine=false
      else
        gunzip -c $f | sed 1d >> "$tmp_out_file"
      fi
      rm $f
    done
}

# main function
function main {
    local sYear=1929
    local lYear=2014

    for year in `seq $sYear $lYear`; do
      downloadData $year
      processData $year
    done

    mv "$output_folder" /tmp

    sudo -u hdfs hdfs dfs -put "/tmp/$output_folder" /weather
}

main
