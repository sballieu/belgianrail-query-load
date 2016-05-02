#!/bin/bash

wha=9 #9/10 queries will be not wheelchair accessible
lines=`wc -l $1 | cut -d ' ' -f 1`

for i in $(seq 1 $lines);
do
	rand=$(( ( RANDOM % 10 )  + 1 ))
	if [ $rand -gt $wha ]
	then
		sed -i ""$i"s/^{/{\"wha\":true,/" $1
	else
		sed -i ""$i"s/^{/{\"wha\":false,/" $1
	fi
done
