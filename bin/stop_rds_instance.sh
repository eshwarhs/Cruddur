#!/bin/bash

# Replace 'YOUR_RDS_INSTANCE_IDENTIFIER' with the actual RDS instance identifier.
RDS_INSTANCE_IDENTIFIER="cruddur-instance"

# Check the status of the RDS instance
RDS_STATUS=$(aws rds describe-db-instances --db-instance-identifier $RDS_INSTANCE_IDENTIFIER --query 'DBInstances[0].DBInstanceStatus' --output text)

if [ "$RDS_STATUS" == "available" ]; then
  # Stop the RDS instance if it's running
  aws rds stop-db-instance --db-instance-identifier $RDS_INSTANCE_IDENTIFIER
  echo "AWS RDS instance is stopped."
else
  echo "AWS RDS instance is not running. No action needed."
fi

