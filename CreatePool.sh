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
fi

