#!/bin/bash
[[ $1 ]] || { echo "Give the lc normal server's pid as a first argument"; exit; };
[[ $2 ]] || { echo "Give the lc filter server's pid as a second argument"; exit; };
[[ $3 ]] || { echo "Give the queryserver's pid as the third argument"; exit; };
# Script to load the benchmark that will run for 4.5h (6 query mixes, 3 set-ups, 15 minutes each) 

q0="query-mixes/round0.jsonstream"
q1="query-mixes/round1.jsonstream"
q2="$q1 query-mixes/round2.jsonstream"
q3="$q2 query-mixes/round3.jsonstream"
q4="$q3 query-mixes/round4.jsonstream"
q5="$q4 query-mixes/round5.jsonstream"
q6="$q5 query-mixes/round6.jsonstream"
q7="$q6 query-mixes/round7.jsonstream"
q8="$q7 query-mixes/round8.jsonstream"
q9="$q8 query-mixes/round9.jsonstream"
q10="$q9 query-mixes/round10.jsonstream"
q11="$q10 query-mixes/round11.jsonstream"
q12="$q11 query-mixes/round12.jsonstream"
q13="$q12 query-mixes/round13.jsonstream"
q14="$q13 query-mixes/round14.jsonstream"
q15="$q14 query-mixes/round15.jsonstream"
q16="$q15 query-mixes/round16.jsonstream"
q17="$q16 query-mixes/round17.jsonstream"

cache_qs="/home/sander/git/testing/query-server-nginx/"
cache_lc_normal="/home/sander/git/testing/server-normal-nginx/"
cache_lc_filter="/home/sander/git/testing/server-filter-nginx/"

rm -r results;
mkdir results;

q00="query-mixes/test.jsonstream";

#sudo ./bin/query-server.sh $3 $cache_qs $q00 "0.5";
sudo ./bin/normal-server.sh $1 $cache_lc_normal $q00 "0.5"

#sudo $cache_qs"start.sh" &
#sleep 5;
#sort -n -t: -k2 $q00 | ./bin/runner.js -c $qs > results/experiment-test-qs.csv &
#pidstat -p $! 10 1 >> client_cpu.log &
#pidstat -p $2 10 1| grep Gemiddeld >> server_cpu.log &
#pidstat -p $(cat $cache_qs"logs/nginx.pid") 10 1| grep Gemiddeld >> nginx_cpu.log;
#sudo kill $(pidof nginx)


## Launch Experiment 0.5
#sort -n -t: -k2 $q0 | ./bin/runner.js -c $lc > results/experiment-0_5-lc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q0 | ./bin/runner.js -c $qs > results/experiment-0_5-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q0 | ./bin/runner.js -c $lcnc > results/experiment-0_5-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;

## Launch Experiment 1
#sort -n -t: -k2 $q1 | ./bin/runner.js -c $lc > results/experiment1-lc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q1 | ./bin/runner.js -c $qs > results/experiment1-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q1 | ./bin/runner.js -c $lcnc > results/experiment1-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;

## Launch Experiment 2
#sort -n -t: -k2 $q2 | ./bin/runner.js -c $lc > results/experiment2-lc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q2 | ./bin/runner.js -c $qs > results/experiment2-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q2 | ./bin/runner.js -c $lcnc > results/experiment2-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;

## Launch Experiment 3
#sort -n -t: -k2 $q3 | ./bin/runner.js -c $lc > results/experiment2-lc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q3 | ./bin/runner.js -c $qs > results/experiment2-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q3 | ./bin/runner.js -c $lcnc > results/experiment2-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;

## Launch Experiment 4
#sort -n -t: -k2 $q4 | ./bin/runner.js -c $lc > results/experiment4-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q4 | ./bin/runner.js -c $qs > results/experiment4-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q4 | ./bin/runner.js -c $lcnc > results/experiment4-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;

## Launch Experiment 5
#sort -n -t: -k2 $q5 | ./bin/runner.js -c $lc > results/experiment4-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q5 | ./bin/runner.js -c $qs > results/experiment4-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q5 | ./bin/runner.js -c $lcnc > results/experiment4-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;

## Launch Experiment 6
#sort -n -t: -k2 $q6 | ./bin/runner.js -c $lc > results/experiment5-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q6 | ./bin/runner.js -c $qs > results/experiment5-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q6 | ./bin/runner.js -c $lcnc > results/experiment5-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;

## Launch Experiment 7
#sort -n -t: -k2 $q7 | ./bin/runner.js -c $lc > results/experiment6-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q7 | ./bin/runner.js -c $qs > results/experiment6-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q7 | ./bin/runner.js -c $lcnc > results/experiment6-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;

## Launch Experiment 8
#sort -n -t: -k2 $q8 | ./bin/runner.js -c $lc > results/experiment8-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q8 | ./bin/runner.js -c $qs > results/experiment8-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q8 | ./bin/runner.js -c $lcnc > results/experiment8-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;

### Launch Experiment 9
#sort -n -t: -k2 $q9 | ./bin/runner.js -c $lc > results/experiment8-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q9 | ./bin/runner.js -c $qs > results/experiment8-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q9 | ./bin/runner.js -c $lcnc > results/experiment8-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#
### Launch Experiment 10
#sort -n -t: -k2 $q10 | ./bin/runner.js -c $lc > results/experiment9-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q10 | ./bin/runner.js -c $qs > results/experiment9-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q10 | ./bin/runner.js -c $lcnc > results/experiment9-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#
#
### Launch Experiment 11
#sort -n -t: -k2 $q11 | ./bin/runner.js -c $lc > results/experiment10-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q11 | ./bin/runner.js -c $qs > results/experiment10-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q11 | ./bin/runner.js -c $lcnc > results/experiment10-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#
### Launch Experiment 12
#sort -n -t: -k2 $q12 | ./bin/runner.js -c $lc > results/experiment11-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q12 | ./bin/runner.js -c $qs > results/experiment11-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q12 | ./bin/runner.js -c $lcnc > results/experiment11-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#

## Launch Experiment 16
#sort -n -t: -k2 $q16 | ./bin/runner.js -c $lc > results/experiment16-lc.csv&
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q16 | ./bin/runner.js -c $qs > results/experiment16-queryserver.csv &
#pidstat -p $2 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
#sort -n -t: -k2 $q16 | ./bin/runner.js -c $lcnc > results/experiment16-lcnc.csv &
#pidstat -p $1 895 1| grep Gemiddeld >> benchmarkcpu.log;
#sleep 10;
