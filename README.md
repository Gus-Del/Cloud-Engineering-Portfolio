# Cloud Engineering Portfolio

Welcome to my cloud engineering portfolio. This repository documents my hands-on projects, labs, architecture designs, scripts, and technical learning as I build practical experience in cloud infrastructure, Linux administration, networking, automation, and security.

Drawing on my insurance industry background, these projects demonstrate practical skills in cloud infrastructure, databases, automation, and access security relevant to supporting insurance operations and protecting business data.

## Featured Project

### [AWS EC2 and Linux Fundamentals](https://github.com/Gus-Del/Cloud-Engineering-Portfolio/tree/main/01-AWS-EC2-Linux-Project)

In this project, I:

* Created and configured an AWS EC2 security group.
* Launched an Ubuntu Server 24.04 LTS EC2 instance.
* Connected securely from Windows using SSH and a private key.
* Created Linux directories and files from the command line.
* Managed file permissions with `chmod`.
* Wrote and executed a Bash script.
* Archived and compressed files with `tar` and `gzip`.
* Transferred the completed project to Windows using SCP.
* Terminated the EC2 instance and verified deletion of its EBS volume.
* Documented the process with screenshots and technical explanations.

## Skills and Technologies

### Cloud Infrastructure

* Amazon Web Services
* Amazon EC2
* Amazon EBS
* AWS Security Groups
* VPC and subnet fundamentals

### Linux and Automation

* Ubuntu Linux
* Bash scripting
* Linux file permissions
* SSH and SCP
* Nano
* `tar` and `gzip`

### Development Tools

* Git
* GitHub
* Windows PowerShell
* Python fundamentals

## Project 2

### [EC2 MySQL Lab: one_percent](./ec2-mysql-one-percent/)

In this project, I:

- Launched an Ubuntu t3.micro EC2 instance named database-server
- Installed and ran MySQL 8
- Created database one_percent with coffee_table, customer_name, and customer_order
- Restricted SSH inbound to my IP only
- Terminated the instance when the lab was finished

## Project 3

### [AWS IAM Access Design](./aws-iam-access-design/)

In this project, I:

- Created an IAM user and a developer group with shared permissions.
- Configured an EC2 IAM role for S3 access without storing access keys on the instance.
- Tested S3 access from EC2 using `aws s3 ls`.
- Created a custom policy granting read access to one market-data bucket.
- Enabled multi-factor authentication (MFA) for the IAM user.
- Terminated the test instance and documented the work with screenshots and a JSON policy.

This project demonstrates IAM users, groups, roles, custom policies, and MFA.

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

## Current Learning

I am continuing to develop hands-on experience with:

* AWS IAM and S3
* VPC networking
* Infrastructure as code with Terraform
* Docker and Kubernetes
* Cloud security and automation

## Portfolio Goal

My goal is to build and document practical cloud projects that demonstrate secure infrastructure deployment, Linux administration, troubleshooting, automation, and continuous technical growth.
