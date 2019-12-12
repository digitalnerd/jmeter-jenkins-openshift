#!/bin/bash

jmeter -n -t Tests/$2.jmx -l Results/$2-results.jtl

cat Results/$2-results.jtl

curl -X POST -d "$HOSTNAME" $1

sleep 10
