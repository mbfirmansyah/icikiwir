curl -X PUT http://localhost:8080/firewall/module/enable/0000000000000001
curl -X POST -d '{"nw_src": "10.0.0.1","nw_dst": "10.0.0.2"}' http://localhost:8080/firewall/rules/0000000000000001
curl -X POST -d '{"nw_src": "10.0.0.1","nw_dst": "10.0.0.3"}' http://localhost:8080/firewall/rules/0000000000000001
curl -X POST -d '{"nw_src": "10.0.0.2","nw_dst": "10.0.0.3"}' http://localhost:8080/firewall/rules/0000000000000001
curl -X POST -d '{"nw_src": "10.0.0.2","nw_dst": "10.0.0.1"}' http://localhost:8080/firewall/rules/0000000000000001
curl -X POST -d '{"nw_src": "10.0.0.3","nw_dst": "10.0.0.1"}' http://localhost:8080/firewall/rules/0000000000000001
curl -X POST -d '{"nw_src": "10.0.0.3","nw_dst": "10.0.0.2"}' http://localhost:8080/firewall/rules/0000000000000001
