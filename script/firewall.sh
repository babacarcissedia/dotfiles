#!/bin/sh

# flush previous rules
iptables -F
iptables -t nat -F

# change default policy
iptables -P INPUT  DROP
iptables -P OUTPUT ACCEPT # because I am not server

# uncomment line below if server
# iptables -P OUTPUT DROP

# uncomment if computer used as router
iptables -P FORWARD DROP


# allow loopback connection
# for example php to mysql
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT


# let already established connection untouched
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


# specific rules

## [ssh]
SSH_IN_PORT=22
SSH_OUT_PORT=22
iptables -A INPUT -p tcp --dport $SSH_IN_PORT -j ACCEPT
iptables -A OUTPUT -p tcp --dport $SSH_OUT_PORT -j ACCEPT

## [web]
# uncomment if web server
# iptables -A INPUT -p tcp --dport 80 -j ACCEPT


