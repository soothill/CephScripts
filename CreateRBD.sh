#!/bin/bash

# Create RBD Devices

Poolname=$1
NumberOfDevices=$2
SizeOfDevice=$3

if [ "$#" -eq "0" ];
then
  echo
  echo This script will create a given number of RBD Devices in a particular pool
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be deleted
  echo NumberOfDevices :- Number of RBD devices to create
  echo SizeOfDevice :- Size in MBytes
  echo
  exit 1
fi

rbd pool init $Poolname

counter=1
while [ $counter -le $NumberOfDevices ]
do
    rbd create $Poolname$counter --size $SizeOfDevice -p $Poolname
    ((counter++))
done


rbd ls -l $Poolname
