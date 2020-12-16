#!/bin/bash

# Force setting the key and secret key for a given user

radosgw-admin user create --uid=benchuser --display-name="Benchmark Test User"

radosgw-admin key create --uid=benchuser --key-type=s3 --access-key testing --secret-key testingsecret