#!/usr/bin/bash

FILE=~/cryosparc/cryosparc_master/cryosparc_compute/cluster.py
SEARCH="res = subprocess.check_output(shlex.split(cmd), stderr=subprocess.STDOUT).decode()"
REPLACE="res = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode()"

echo Searching: $FILE
echo for $SEARCH
echo replace with $REPLACE

sed -i "s/${SEARCH}/${REPLACE}/g" $FILE

