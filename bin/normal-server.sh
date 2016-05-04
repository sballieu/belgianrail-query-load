#!/bin/bash

[[ $1 ]] || { echo "PID server"; exit; };
[[ $2 ]] || { echo "Folder nginx"; exit; };
[[ $3 ]] || { echo "Query files"; exit; };
[[ $4 ]] || { echo "Name test"; exit; };

lc=config-lc-normal.json

echo "$(date): stating with lc normal test " $4

sudo $2"start.sh" &
sleep 5;
sort -n -t: -k2 $3 | ./bin/runner.js -c $lc > "results/experiment-lcn"$4".csv" &
pidstat -p $1 895 1| grep Gemiddeld >> lcn_server_cpu.log &
pidstat $(pidof nginx | sed 's/ / -p /g' | sed 's/^/-p /') 895 1 | grep Gemiddeld >> lcn_nginx_cpu.log;
echo "----"  >> lcn_nginx_cpu.log;
sleep 600
sudo kill $(pidof nginx);
