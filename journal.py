#!/usr/bin/python3


# Journal // File Creator

import sys
import os
from os.path import expanduser

home = expanduser("~")
argg = sys.argv[1]


# Check if dir exists

if os.path.isdir(home + "/journal") == "false": 
  os.mkdir(home + "/journal")

# Check if file exists, create if no

arggloc = home + "/journal/" + argg + ".txt"

if os.path.exists(arggloc): 
  yesno = input("\nThere is already a file called " + argg + ".txt, do you want to enter another one?\n")
else:
  yesno = "no"

if yesno == "yes":
  print("call the file something else")
else: 
  print("overwrite the file")
