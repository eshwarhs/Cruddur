#!/bin/bash

RDS_INSTANCE_IDENTIFIER="YOUR_RDS_INSTANCE_IDENTIFIER"

# Check the status of the RDS instance
RDS_STATUS=$(aws rds describe-db-instances --db-instance-identifier $RDS_INSTANCE_IDENTIFIER --query 'DBInstances[0].DBInstanceStatus' --output text)

if [ "$RDS_STATUS" == "available" ]; then
  echo "AWS RDS instance is already running. No action needed."
elif [ "$RDS_STATUS" == "stopped" ]; then
  # Start the RDS instance if it's stopped
  aws rds start-db-instance --db-instance-identifier $RDS_INSTANCE_IDENTIFIER
  echo "AWS RDS instance is started."
else
  echo "Unknown AWS RDS instance status: $RDS_STATUS. No action performed."
fi
