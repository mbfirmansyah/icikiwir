#!/bin/bash clear

logfile="/var/log/snort/alert.csv"
tail -s 0 -n 1 -f $logfile | while read line; do

src=`echo $line | cut -f 2 -d ","`
dst=`echo $line | cut -f 3 -d ","`

if [[ $src == *[:]* ]]
	then
	src=`echo $src | cut -f 1 -d ":"`

fi

if [[ $dst == *[:]* ]]
	then
	dst=`echo $dst | cut -f 1 -d ":"`

fi

echo "Start blocking"

curl -X POST -d '{"nw_src": "'$src'", "nw_dst": "'$dst'", "nw_proto": "ICMP", "actions": "DENY", "priority": "2"}' http://localhost:8080/firewall/rules/0000000000000001
rule1s1=`curl -s http://localhost:8080/firewall/rules/0000000000000001 | jq ' .[] | .access_control_list | .[] | .rules | max_by(.rule_id) | .rule_id'`

echo

curl -X POST -d '{"nw_src": "'$dst'", "nw_dst": "'$src'", "nw_proto": "ICMP", "actions": "DENY", "priority": "2"}' http://localhost:8080/firewall/rules/0000000000000001
rule2s1=`curl -s http://localhost:8080/firewall/rules/0000000000000001 | jq ' .[] | .access_control_list | .[] | .rules | max_by(.rule_id) | .rule_id'`

echo

./unblock.sh -rule1s1 $rule1s1 -rule2s1 $rule2s1

done


