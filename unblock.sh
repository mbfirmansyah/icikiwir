#!/bin/bash

while [[ $# -gt 0 ]]; do
	case "$1" in
	-rule1s1)
		rule1_s1=$2
		shift
		;;
	-rule2s1)
		rule2_s1=$2
		shift
		;;
	*)
	esac
	shift

done

echo "=================================================================="

sleep 10

echo "Recovering"

curl -X DELETE -d '{"rule_id" : '$rule1_s1'}' http://localhost:8080/firewall/rules/0000000000000001

curl -X DELETE -d '{"rule_id" : '$rule2_s1'}' http://localhost:8080/firewall/rules/0000000000000001

echo

echo "=================================================================="


