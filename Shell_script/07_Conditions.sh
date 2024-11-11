#!/bin/bash
NUMBER=$1

if [ $NUMBER -gt 100 ]; then
    echo "Give number $NUMBER is Greater than 100"
else
    echo "Give number $NUMBER is Not Greater than 100"
fi
