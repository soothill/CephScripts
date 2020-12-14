#!/bin/bash

# Create RBD Devices

Poolname=$1
NumberOfDevices=$2
SizeOfDevice=$3
EC=$4

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
  echo EC :- Should we use EC for data pool Y/N
  echo
  exit 1
fi

rbd pool init $Poolname

counter=1
while [ $counter -le $NumberOfDevices ]
do
    if [ $EC == "Y" ]
    then
       rbd create $Poolname$counter --size $SizeOfDevice -p $Poolname
    else
        rbd create $Poolname$counter --size $SizeOfDevice -p $Poolname --data-pool $Poolname + "_EC"
    fi
    ((counter++))
done


rbd ls -l $Poolname
