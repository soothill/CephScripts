#!/bin/bash

# Delete RBD Devices

Poolname=$1

if [ "$#" -eq "0" ];
then
  echo
  echo This script will delete all RBD Devices in a particular pool
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be deleted
  echo
  exit 1
fi

for RBDDevname in $(rbd ls -p $Poolname)
do
    echo $RBDDevname
    rbd rm $Poolname/$RBDDevname
done