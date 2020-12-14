#!/bin/bash

# Delete a Pool

PoolName=$1

if [ "$#" -eq "0" ];
then
  echo
  echo This script will delete a given pool
  echo
  echo Parameters need :-
  echo
  echo PoolName :- Name of pool to be deleted
  echo
  exit 1
fi

ceph config set mon mon_allow_pool_delete true
ceph osd pool rm "$PoolName" "$PoolName" --yes-i-really-really-mean-it
for name in $(rados lspools)
do
    echo $name
    if [ "$name" -eq "$PoolName"_EC];
    then 
        ceph osd pool rm "$PoolName"_EC "$PoolName"_EC --yes-i-really-really-mean-it
        ceph osd erasure-code-profile rm $PoolName
    fi
done
ceph config set mon mon_allow_pool_delete false

