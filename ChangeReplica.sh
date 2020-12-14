#!/bin/bash

# Change Number of Replicas on pool

Poolname=$1
Replicas=$2

if [ "$#" -eq "0" ];
then
  echo
  echo This script will change the number of replicas against a pool
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be created
  echo Replicas :- Number of Replicas
  echo 
  exit 1
fi

ceph osd pool set $Poolname size $Replicas

