#!/usr/bin/bash

IP=
FILE=~/cryosparc/cryosparc_master/cryosparc_command/command_core/__init__.py
SEARCH="'--master_hostname', os.environ\['CRYOSPARC_MASTER_HOSTNAME'],"
REPLACE="'--master_hostname', '${IP}',"

echo Searching: $FILE
echo for $SEARCH
echo replace with $REPLACE

sed -i "s/${SEARCH}/${REPLACE}/g" $FILE
