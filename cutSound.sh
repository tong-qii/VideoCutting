#!/bin/bash
if [ $# -ne 3 ]; then
	printf "Usage: ./cutSound.sh <CSV Name> <sourceFolder> <destinationFolder>"
	exit
fi
csvName=$1
srcFolder=$2
destFolder=$3
mkdir -p $destFolder
xsv select Rename,Sec $csvName > converted.csv
INPUT=converted.csv
OLDIFS=$IFS
IFS=,
regex="V.*"
paddingFormat="00:0"
srcFolder="${srcFolder}/"
destFolder="${destFolder}/"
wavFormat=".wav"

[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

while read name time
do
	if [[ $name =~ $regex ]];
	then
		startTime=$( echo "$time" | cut -d "-" -f 1)
		endTime=$( echo "$time" | cut -d "-" -f 2)
		startTime="${paddingFormat}${startTime}"
		endTime="${paddingFormat}${endTime}"
		echo "Name : $name"
		echo "Start Time: $startTime"
		echo "end Time: $endTime"
		echo "Time : $time"
		src="${srcFolder}$name$wavFormat"
		dest="$destFolder$name$wavFormat"
		echo "src : $src"
		echo "dest : $dest"
		ffmpeg -y -i $src -ss $startTime -to $endTime -async 1 $dest < /dev/null
	fi
done < $INPUT
IFS=$OLDIFS

