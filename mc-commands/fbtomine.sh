#!/bin/bash

#screen -S 15005.Fb -X hardcopy "/home/julian/minecraft/logs/test.log"
#tail -n3 "/home/julian/minecraft/logs/test.log" | head -n1

case2 = "testing"
python /home/julian/sh/fbtomcscript.py $case2
