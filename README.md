# Cloud Engineering Portfolio

Welcome to my cloud engineering portfolio. This repository documents my hands-on projects, labs, architecture designs, scripts, and technical learning as I build practical experience in cloud infrastructure, Linux administration, networking, automation, and security.

Drawing on my insurance industry background, these projects demonstrate practical skills in cloud infrastructure, databases, automation, and access security relevant to supporting insurance operations and protecting business data.

## Project 1

### [AWS EC2 and Linux Fundamentals](https://github.com/Gus-Del/Cloud-Engineering-Portfolio/tree/main/01-AWS-EC2-Linux-Project)

In this project, I:

- Created and configured an AWS EC2 security group.
- Launched an Ubuntu Server 24.04 LTS EC2 instance.
- Connected securely from Windows using SSH and a private key.
- Created Linux directories and files from the command line.
- Managed file permissions with `chmod`.
- Wrote and executed a Bash script.
- Archived and compressed files with `tar` and `gzip`.

## Project 2

### [EC2 MySQL Lab: one_percent](https://github.com/Gus-Del/Cloud-Engineering-Portfolio/tree/main/ec2-mysql-one-percent)

In this project, I:

- Launched an Ubuntu t3.micro EC2 instance named database-server
- Installed and ran MySQL 8
- Created database one_percent with coffee_table, customer_name, and customer_order
- Restricted SSH inbound to my IP only
- Terminated the instance when the lab was finished

## Project 3

### [AWS IAM Access Design](https://github.com/Gus-Del/Cloud-Engineering-Portfolio/tree/main/aws-iam-access-design)

In this project, I:

- Created an IAM user and a developer group with shared permissions.
- Configured an EC2 IAM role for S3 access without storing access keys on the instance.
- Tested S3 access from EC2 using `aws s3 ls`.
- Created a custom policy granting read access to one market-data bucket.
- Enabled multi-factor authentication (MFA) for the IAM user.
- Terminated the test instance and documented the work with screenshots and a JSON policy.

## Project 4

### [Ansible NGINX Web Fleet](https://github.com/Gus-Del/Cloud-Engineering-Portfolio/tree/main/ansible-nginx-web-fleet)

In this project, I:

- Used Terraform to provision one Ansible control node and three Amazon Linux 2023 web servers (t3.micro)
- Configured a dedicated control node so configuration management stays separate from the application hosts
- Wrote an Ansible inventory and playbook for Amazon Linux (using `dnf`)
- Installed and started NGINX on all three web servers from the control node
- Managed SSH keys securely (private key copied to the control node and locked down with `chmod 400`)
- Verified NGINX was active on the web servers
- Stopped the instances after verification to avoid ongoing charges

This project shows repeatable infrastructure provisioning with Terraform and configuration management with Ansible.

## Project 5

### [Terraform EC2 and S3](https://github.com/Gus-Del/Cloud-Engineering-Portfolio/tree/main/terraform-aws-ec2-s3)

In this project, I:

- Wrote Terraform configuration to provision an Amazon Linux 2023 EC2 instance (t3.micro) and an S3 bucket
- Refactored the EC2 instance into a reusable module
- Performed an in-place update by changing the instance Name tag (plan showed 1 to change)
- Used `force_destroy` on the S3 bucket so cleanup would not fail
- Ran `terraform destroy` to remove all resources cleanly
- Kept no access keys, state files, or secrets in the repository

This project demonstrates infrastructure-as-code principles: defining desired state, applying changes, and destroying resources when finished.

## Project 6

### [Dockerized Flask App with Kubernetes](https://github.com/Gus-Del/Cloud-Engineering-Portfolio/tree/main/docker-kubernetes-flask)

In this project, I:

- Containerized a Python Flask application with Docker
- Built and ran the image with port mapping
- Deployed NGINX to a local Kubernetes cluster
- Created a Deployment and Service
- Scaled the Deployment to 3 replicas

## Project 7

### [Jenkins CI/CD on AWS EC2 with Docker](https://github.com/Gus-Del/Cloud-Engineering-Portfolio/tree/main/jenkins-ec2-docker-cicd)

In this project, I:

- Launched a free-tier Amazon Linux 2023 EC2 instance (t3.micro)
- Configured security group rules for SSH, HTTP, and Jenkins (port 8080)
- Installed Docker and ran the official Jenkins LTS container
- Completed Jenkins initial setup and plugin installation
- Created declarative Jenkinsfiles for application pipelines and Docker builds
- Terminated the instance after documenting the work

This project demonstrates practical CI/CD, containerization, and AWS infrastructure skills.

## Current Learning

I am continuing to develop hands-on experience with:

- AWS IAM, S3, and EC2
- VPC networking and security groups
- Infrastructure as code with Terraform
- Configuration management with Ansible
- Docker and Kubernetes
- CI/CD pipelines with Jenkins
- Cloud security and automation

## Portfolio Goal

My goal is to build and document practical cloud projects that demonstrate secure infrastructure deployment, Linux administration, troubleshooting, automation, and continuous technical growth.
