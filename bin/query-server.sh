#!/bin/bash

[[ $1 ]] || { echo "PID server"; exit; };
[[ $2 ]] || { echo "Folder nginx"; exit; };
[[ $3 ]] || { echo "Query files"; exit; };
[[ $4 ]] || { echo "Name test"; exit; };

qs=config-queryserver.json

echo "$(date): stating with query test " $4

sudo $2"start.sh" &
sleep 5;
sort -n -t: -k2 $3 | ./bin/runner.js -c $qs > "results/experiment-qs"$4".csv" &
pidstat -p $1 895 1| grep Gemiddeld >> qs_server_cpu.log &
pidstat $(pidof nginx | sed 's/ / -p /g' | sed 's/^/-p /') 895 1 | grep Gemiddeld >> qs_nginx_cpu.log;
echo "----"  >> qs_nginx_cpu.log;
sleep 300
sudo kill $(pidof nginx);
