#!/bin/bash

for i in $(ls -1 Tests | grep jmx)
do
    echo "*** Testing a ${i} file"
    jmeter -n -t Tests/${i} -l Results/${i}-results.jtl
    cat Results/${i}-results.jtl
done

sleep 10
