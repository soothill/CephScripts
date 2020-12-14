#!/bin/bash

# Delete a Pool

Poolname=$1

if [ "$#" -eq "0" ];
then
  echo
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be deleted
  echo
  exit 1
fi

ceph config set mon mon_allow_pool_delete true
ceph osd pool rm "$Poolname" "$Poolname" --yes-i-really-really-mean-it
ceph config set mon mon_allow_pool_delete false

