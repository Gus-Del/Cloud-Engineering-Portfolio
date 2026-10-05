## Project 4

### [Terraform EC2 and S3](terraform-aws-ec2-s3)

In this project, I:

- Installed Terraform on the computer and confirmed the version from the terminal.
- Created an IAM user for programmatic access and verified the AWS CLI identity before creating any resource.
- Wrote a Terraform file that launched an Amazon Linux 2023 EC2 instance in us-east-1.
- Previewed the change with `terraform plan`, then created the instance with `terraform apply`.
- Hit a free-plan block on `t2.small`, kept `t3.micro`, and updated the Name tag in place.
- Destroyed the instance from the state file, then created an S3 bucket from the same project.
- Moved the instance into a module and called it from the root file.
- Destroyed the bucket and the module instance together when the proof was done.

No access keys or Terraform state are committed.
