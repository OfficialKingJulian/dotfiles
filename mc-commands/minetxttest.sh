#!/bin/bash

CONTENT="$(comm -23 /home/julian/minecraft/logs/latest.log /home/julian/minecraft/logs/scndlatest.log)"

TEST="$(echo ${CONTENT})"


# For testing
echo ${TEST}

# Test using BASH_REMATCH

#re='\[[a-zA-Z]+[^0-9:]+\]'
#while [[ $TEST =~ $re ]]; do
#   TEST=${BASH_REMATCH[1]}${BASH_REMATCH[2]}
#done


# Test using 'sed'

echo "$TEST" | sed -e 's/\[[a-zA-Z]+[^0-9:]+\]/X/g' -e 's/\[[a-zA-Z]+[^0-9:]+\]/N/g'

echo "bloop" 

# As this is the testing one, send to myself
# screen -S Fb -X stuff "m \"Julian\" ${TEST} \n"


# Make Copy to compare to next minute
sudo cp /home/julian/minecraft/logs/latest.log /home/julian/minecraft/logs/scndlatest.log
