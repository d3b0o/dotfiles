#!/bin/sh
 
echo "$(/usr/sbin/ifconfig wlp1s0 | grep "inet " | awk '{print $2}')"
