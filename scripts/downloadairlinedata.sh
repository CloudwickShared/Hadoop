#!/bin/bash

mkdir -p airline_data
cd airline_data
for year in {2010..2014}
do
    for month in {1..12}
    do
	echo $year _ $month
	wget http://www.transtats.bts.gov/Download/On_Time_On_Time_Performance_"$year"_"$month".zip
	sleep 5
    done
done
cd ..




