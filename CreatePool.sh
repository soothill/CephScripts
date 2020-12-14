#!/bin/bash

# Create a pool

PoolName=$1
PGNum=$2
Protection=$3
K=$4
M=$5

if [ "$#" -eq "0" ];
then
  echo
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be created
  echo PGNum :- Number of PGs
  echo Protection :- Protection type Replica or EC 
  echo K :- Erasure coded number of pieces
  echo M :- Erasure coded number of parity pieces
  exit 1
fi

if [ "$Protection" == "Replica" ]
then
    ceph osd pool create $PoolName $PGNum  $PGNum replicated --autoscale-mode=off
    exit 0
fi

if [ "$Protection" == "EC" ]
then
    if [ "$#" -eq "5" ]
    then
        ceph osd erasure-code-profile set $PoolName k=$K m=$M
        ceph osd pool create $PoolName $PGNum  $PGNum replicated --autoscale-mode=off
        ceph osd pool create $PoolName"_EC" $PGNum  $PGNum erasure $PoolName --autoscale-mode=off
        ceph osd pool set $PoolName"_EC" allow_ec_overwrites true
    else
        Echo Not enough parameters passed
        exit 1
    fi
fi
