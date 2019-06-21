#!/bin/bash

CONTENT="$(comm -23 /home/julian/minecraft/logs/latest.log /home/julian/minecraft/logs/scndlatest.log)"

TEST="$(echo ${CONTENT})"

echo ${TEST}

screen -S 15005.Fb -X stuff "m \"julian.rocks\" ${TEST} \n"

# Make 2nd Copy
sudo cp /home/julian/minecraft/logs/latest.log /home/julian/minecraft/logs/scndlatest.log


