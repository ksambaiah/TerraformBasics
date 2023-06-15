# AWS Cli commands
Terraform is useful to check status of resources and shutdown unwanted or create new ones based on the current state of infrastructure. AWS cli is quick way of check resources (not good if one creates using aws cli some and some via terraform).

## S3 command reference

 - Create bucket (or make bucket)  **aws s3 mb s3://bucketname**
 - **aws s3 ls s3://** lists bucket names
 - **aws s3 ls s3://bucketname --recursive** Lists recursively objects inside bucket
 -  **aws s3 rb s3://bucketname**  rb for remove bucket
 - **aws s3 ls s3://bucketname --recursive  --human-readable --summarize** Total size in human readable format.
 - **aws s3 cp localfile s3://bucketname/** Copies localfile to bucket.
 - **aws s3 s3://bucketname/localfile .** Copies s3 objects to local file system
 -  Sync local files to bucket or from bucket to local file system etc are other options.

## EC2 cli
- aws ec2 describe-instances
 - aws ec2 start-instances --instance-ids i-dddddd70
 - aws ec2 stop-instances --instance-ids i-5c8282ed
 - aws ec2 terminate-instances --dry-run --instance-ids i-dddddd70
 - aws ec2 create-tags --resources i-dddddd70 --tags Key=Department,Value=Finance
 - aws ec2 describe-volumes
 - aws ec2 attach-volume  --volume-id vol-1d5cc8cc --instance-id i-dddddd70 --device /dev/sdh
 - aws ec2 run-instances --dry-run --image-id ami-08111162 --count 1 --instance-type t1.micro --key-name MyKeyPair --security-groups my-ami-security-group
 - aws ec2 reboot-instances --instance-ids i-dddddd70
 - aws ec2 modify-instance-attribute --instance-id i-44a44ac3 --instance-type "{\"Value\": \"m1.small\"}"
 - aws ec2 create-image --instance-id i-44a44ac3 --name "Dev AMI" --description "AMI for development server"
 - aws ec2 describe-images --image-ids ami-2d574747
 - aws ec2 deregister-image --image-id ami-2d574747 && aws ec2 delete-snapshot --snapshot-id snap-4e665454
 - aws ec2 delete-snapshot --snapshot-id snap-4e665454
 - aws ec2 modify-instance-attribute --instance-id i-44a44ac3 --disable-api-termination
 - aws ec2 modify-instance-attribute --instance-id i-44a44ac3 --no-disable-api-termination
 - aws ec2 get-console-output --instance-id i-44a44ac3
 - aws ec2 monitor-instances --instance-ids i-44a44ac3
 - aws ec2 unmonitor-instances --instance-ids i-44a44ac3
 - aws ec2 describe-key-pairs
 - aws ec2 create-key-pair --key-name dev-servers
 - aws ec2 delete-key-pair --key-name dev-servers
