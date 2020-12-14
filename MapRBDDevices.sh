#!/bin/bash

# Create RBD Devices

Poolname=$1

if [ "$#" -eq "0" ];
then
  echo
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
done