#Ceph Scripts to help with benchmarking

These are a set of simple scripts to help with automating the creation/deletion of pools of different types for benchmarking.

CreatePool.sh
This script will create a pool to allow benchmarks to be run against it.
You have an option of choosing if this pool is a replica pool or an EC pool.

If its an EC pool it will create two pools one with the poolname and a second one with the _EC suffix.
This is done so that RBD devices can be mapped to an EC pool.

ChangeReplica.sh 
This script will change the number of Replicas against a pool.

CreateRBD.sh
This script will create a given number of devices against a pool. If there is a pool name with _EC suffix it will create the devices using using the erasure coded pool for the data of the object

MapRBDDevice.sh
This script will map all the RBD devices within a given pool to a the host on which the script is being run.

UNMapRBDDevices.sh
This will unmap all the devices from within a given pool that are mapped to the host

DeleteRBD.sh
This will delete all the RBD devices within a given pool.

DeletePool.sh
This will delete both the pool and any _EC suffixed pool as well as any EC profile that has been created for that pool.

PreBenchmark.sh
This will issue variosu commands that should be done before a benchmark such as disabling scrubbing and deep scrubbing 

PostBenchmark.sh
This script will re=enable anythings that have been turned off in the PreBenchmark script.


