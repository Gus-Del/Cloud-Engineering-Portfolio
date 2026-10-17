# Jenkins CI/CD on AWS EC2 with Docker

Hands-on project demonstrating how to deploy a Jenkins continuous integration and continuous delivery (CI/CD) server on Amazon EC2 using Docker.

## Project Overview

In this project I:

- Launched a free-tier Amazon Linux 2023 EC2 instance (t3.micro)
- Configured a security group allowing SSH (22), HTTP (80), and Jenkins (8080)
- Connected securely via SSH using a key pair
- Installed and configured Docker on the EC2 instance
- Ran the official Jenkins LTS image inside a Docker container with port mapping
- Completed the Jenkins initial setup (admin user + suggested plugins)
- Wrote a simple declarative Jenkinsfile with Build, Test, and Deploy stages
- Wrote a second Jenkinsfile demonstrating Docker image build and push stages
- Documented the full process and terminated the instance after completion

## Technologies Used

- Amazon Web Services (EC2, Security Groups)
- Amazon Linux 2023
- Docker
- Jenkins (LTS)
- Jenkins Pipeline (Declarative)
- SSH / Key pairs
- Visual Studio Code

## Repository Structure

```
jenkins-ec2-docker-cicd/
├── README.md
├── Jenkinsfile                  # Basic pipeline (Build → Test → Deploy)
└── Jenkinsfile-docker           # Docker build and push pipeline
```

## Key Concepts Demonstrated

- **EC2 provisioning** — free-tier instance, security groups, key-based SSH access
- **Containerization** — running Jenkins in Docker for easy management
- **CI/CD pipelines** — declarative Jenkinsfiles with clear stages
- **Security** — least-privilege ports, key pair authentication, instance termination
- **Documentation** — clear steps suitable for a portfolio or interview discussion

## How This Supports DevOps / Cloud Engineering Roles

This project shows practical experience with:

- Infrastructure provisioning on AWS
- Containerized application deployment
- Pipeline-as-code
- Secure remote access and cleanup practices

It is a solid foundation for discussing CI/CD, Docker, and AWS in technical interviews.

---

**Author:** Gus Del Aguila Jr.  
**Portfolio:** [Cloud-Engineering-Portfolio](https://github.com/Gus-Del/Cloud-Engineering-Portfolio)
