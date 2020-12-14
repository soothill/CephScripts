#!/bin/bash

# Create RBD Devices

Poolname=$1
NumberOfDevices=$2
SizeOfDevice=$3

if [ "$#" -eq "0" ];
then
  echo
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be deleted
  echo NumberOfDevices :- Number of RBD devices to create
  echo SizeOfDevice :- Size in Gbytes
  echo
  exit 1
fi

rbd pool init $Poolname

counter=1
while [ $counter -le $NumberOfDevices ]
do
    rbd create "$Poolname"+"$Counter" --size $SizeOfDevice -p $Poolname
    ((counter++))
done


rbd ls -l $Poolname
