#!/bin/bash

# Create RBD Devices

Protection=$1
PGNUM=$2
K=$3
M=$4
PoolName=default.rgw.buckets.data
PoolName=Test


if [ "$#" -eq "0" ];
then
  echo
  echo This script will create a given number of RBD Devices in a particular pool
  echo
  echo Parameters need :-
  echo
  echo Protection :- Replica or EC
  echo PGNum :- Number of PGs for new pool
  echo K :- Value for K
  echo M :- Value for M
  echo
  exit 1
fi

# Create new Pool
if [ "$Protection" == "Replica" ]
then
    ceph osd pool create $PoolName.new $PGNum  $PGNum replicated --autoscale-mode=off
    exit 0
fi

if [ "$Protection" == "EC" ]
then
    if [ "$#" -eq "4" ]
    then
        ceph osd erasure-code-profile set $PoolName k=$K m=$M
        ceph osd pool create $PoolName.new $PGNum  $PGNum erasure $PoolName  --autoscale-mode=off
    else
        Echo Not enough parameters passed
        exit 1
    fi
fi

# Stop RadosGW processes

ceph orch stop rgw

# Copy old pool to new pool

rados cppool $PoolName $PoolName.new

# Rename Existing 

ceph osd pool rename $PoolName $PoolName.old

ceph osd pool rename $PoolName.new $PoolName

ceph orch start rgw

ceph config set mon mon_allow_pool_delete true

ceph osd pool rm $PoolName.old $PoolName.old --yes-i-really-really-mean-it

ceph config set mon mon_allow_pool_delete false


