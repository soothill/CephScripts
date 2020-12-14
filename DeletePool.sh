#!/bin/bash

# Delete a Pool

Poolname=$1

if [ "$#" -eq "0" ];
then
  echo
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be created
  echo
fi

ceph osd pool rm $Poolname $Poolname --yes-i-really-really-mean-it

