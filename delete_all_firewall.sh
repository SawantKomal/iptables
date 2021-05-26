#!/bin/bash

#1. Set the ACCEPT Policy on all the chains 

##NOTE: Policy can be set to only INPUT, OUTPUT and FORWORD CHAINS

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWORD ACCEPT

#2. Flush all the netfilter/iptables table

iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F
iptables -t raw -F

#3. Delete all user-defined CHAINS

iptables -X
