# Date: Sept 2
#
# Version: 1.0.0
#
# This script will report the AWS resource usage
###################################

# aws s3
# aws ec2
# aws lambda
# aws iam users

# listing s3 buckets
#set -x

echo "s3: "
aws s3 ls > resourceTracker.txt

#list EC2 Instances
echo "ec2 instances: "
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourceTracker.txt

# list lambda
echo "lambda: "
aws lambda list-functions >> resourceTracker.txt

#list iam users
echo "iam users: "
aws iam list-users | jq '.Users[].UserName' >> resourceTracker.txt

