#!/bin/bash

# Replace 'YOUR_RDS_INSTANCE_IDENTIFIER' with the actual RDS instance identifier.
RDS_INSTANCE_IDENTIFIER="cruddur-instance"

# Stop the RDS instance
aws rds stop-db-instance --db-instance-identifier $RDS_INSTANCE_IDENTIFIER
