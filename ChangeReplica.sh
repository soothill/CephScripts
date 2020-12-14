#!/bin/bash

# Change Number of Replicas on pool

Poolname=$1
Replicas=$2

if [ "$#" -eq "0" ];
then
  echo
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be created
  echo Replicas :- Number of Replicas
  echo 
fi

ceph osd pool set $Poolname size $Replicas

