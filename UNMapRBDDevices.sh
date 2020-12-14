#!/bin/bash

# Unmap RBD Devices

Poolname=$1

if [ "$#" -eq "0" ];
then
  echo
  echo This script will unmap all the RBD devices for a given pool
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be unmapped
  echo
  exit 1
fi

for RBDDevname in $(rbd ls -p $Poolname)
do
    echo $RBDDevname
    rbd device unmap $Poolname/$RBDDevname
done