#!/usr/bin/bash

#fix master hostname

IP=
FILE=~/cryosparc/cryosparc_master/cryosparc_command/command_core/__init__.py
SEARCH="'--master_hostname', os.environ\['CRYOSPARC_MASTER_HOSTNAME'],"
REPLACE="'--master_hostname', '${IP}',"

echo Searching: $FILE
echo for $SEARCH
echo replace with $REPLACE

sed -i "s/${SEARCH}/${REPLACE}/g" $FILE


#fix cluster submission scripts

FILE=~/cryosparc/cryosparc_master/cryosparc_compute/cluster.py
SEARCH="res = subprocess.check_output(shlex.split(cmd), stderr=subprocess.STDOUT).decode()"
REPLACE="res = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode()"

echo Searching: $FILE
echo for $SEARCH
echo replace with $REPLACE

sed -i "s/${SEARCH}/${REPLACE}/g" $FILE

#disable importing on master node

echo "export CRYOSPARC_DISABLE_IMPORT_ON_MASTER=true" >> ~/cryosparc/cryosparc_master/config.sh
