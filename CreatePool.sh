#!/bin/bash

# Create a pool

PoolName=$1
PGNum=$2
Protection=$3

if [ "$#" -eq "0" ];
then
  echo
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be created
  echo PGNum :- Number of PGs
  echo Protection :- Protection type Replica or EC
  exit 1
fi

if [ "$Protection" == "Replica" ]
then
    ceph osd pool create $PoolName $PGNum  $PGNum replicated --autoscale-mode=off
fi

if [ "$Protection" == "EC" ]
then
    echo Not Implemented yet
fi
