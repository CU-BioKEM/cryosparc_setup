#!/usr/bin/bash

#fix master hostname

sed -i "/export CRYOSPARC_MASTER_HOSTNAME/d" ~/cryosparc/cryosparc_master/config.sh
source license.src
echo "export CRYOSPARC_MASTER_HOSTNAME=${IP_ADDRESS}" >> ~/cryosparc/cryosparc_master/config.sh
echo "export CRYOSPARC_HOSTNAME_CHECK=${IP_ADDRESS}" >> ~/cryosparc/cryosparc_master/config.sh 

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
