#!/bin/bash
source downloads.md5 # this sets the array "md5s" as the appropriate numbers
mkdir -p airline_data
cd airline_data
# Now we download all the files by year and month
for year in {2010..2014}
do
    for month in {1..12}
    do
	FILENAME="On_Time_On_Time_Performance_${year}_${month}.zip"
	if [ ! -f ${FILENAME} ]
	then
	    wget -q -nc http://www.transtats.bts.gov/Download/${FILENAME}
	fi

	thismd5=`md5sum $FILENAME | cut -d\  -f 1`
	expectedmd5=${md5s[$FILENAME]}
	if [ ${expectedmd5} != ${thismd5} ]
	then
	    echo "It's all wrong! File ${FILENAME} is wrong" 1>&2
	    exit 1
	fi
    done
done
echo "All files correctly downloaded" 1>&2
# And finally combine these into one large gzipped csv file per year
unzip -p On_Time_On_Time_Performance_2010_1.zip On_Time_On_Time_Performance_2010_1.csv | head -1 >> header.csv
for year in {2010..2014}
do
    OUTFILE="On_Time_On_Time_Performance_${year}.csv"
    cp header.csv ${OUTFILE}
    for month in {1..12}
    do
	INFILE="On_Time_On_Time_Performance_${year}_${month}"
	unzip -p ${INFILE}.zip ${INFILE}.csv | sed '1d' >> ${OUTFILE}
    done
    echo "Creating GZip file for ${year}" 1>&2
    gzip ${OUTFILE}
    echo "${OUTFILE} is zipped" 1>&2
done

cd ..
