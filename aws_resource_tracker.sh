#!/bin/bash
##
###########################
## Author: Suarim
## Version: v1
## This script will report AWS resource usage
##################
set -x
##
## AWS S3
## AWS EC2
## AWS LAMBDA
## AWS IAM USER
##
####################################
#
## Define the output file
OUTPUT_FILE="aws_resource_report.txt"
#
# S3 Buckets
echo "s3" >> $OUTPUT_FILE
aws s3 ls >> $OUTPUT_FILE
#
# EC2 Instances
echo "ec2" >> $OUTPUT_FILE
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> $OUTPUT_FILE
#
# LAMBDA
echo "lambda" >> $OUTPUT_FILE
aws lambda list-functions >> $OUTPUT_FILE
#
# IAM users
echo "print iam" >> $OUTPUT_FILE
aws iam list-users >> $OUTPUT_FILE
