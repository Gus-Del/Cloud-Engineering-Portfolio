# Tech Challenge 1 – ECS Fargate + Terraform + Jenkins

A hands-on project that deploys a React frontend and Express backend to AWS ECS Fargate using Terraform. Includes an Application Load Balancer with path-based routing, ECR repositories, auto-scaling, and a Jenkins CI/CD pipeline. Demonstrates infrastructure-as-code, containerization, load balancing, auto-scaling, and continuous deployment.

## Technologies

- AWS ECS Fargate
- Terraform (HCL)
- Application Load Balancer (ALB)
- Amazon ECR
- Docker
- Jenkins (LTS container)
- React + Express
- AWS IAM, VPC, Auto Scaling

## What I Did

- Provisioned a complete AWS environment with Terraform (VPC, subnets, security groups, ECS cluster, services, ALB, target groups, ECR repositories, and IAM roles).
- Built and pushed Docker images for the frontend and backend to private ECR repositories.
- Configured path-based routing on the ALB (`/` → frontend, `/api` → backend).
- Updated the frontend `config.js` with the ALB DNS so the React app could call the backend.
- Forced new deployments so ECS pulled the latest images.
- Set task definitions to 0.5 vCPU / 1 GB as required.
- Implemented Application Auto Scaling (min 1, max 4, target 50% average CPU utilization).
- Stood up Jenkins in a Docker container, completed the setup wizard, and created a working pipeline job.
- Documented the live ALB URL, Jenkins access, and reproduction steps in a private GitHub repository and shared it with the reviewer.

## Deployed Application

- **ALB URL:** http://tech-challenge-alb-368603018.us-east-1.elb.amazonaws.com
- The page displays a UUID when the frontend successfully communicates with the backend.

## Project Structure

```
tech-challenge-1-ecs-fargate/
├── README.md
├── terraform/
│   └── main.tf                  # Core Terraform configuration (excerpt)
├── examples/
│   ├── config.js                # Frontend API URL configuration
│   └── Jenkinsfile              # Example declarative pipeline
└── screenshots/                 # Key verification screenshots
```

## Key Files

**terraform/main.tf** — Defines the ECS cluster, task definitions (cpu = 512, memory = 1024), services, ALB listener rules, ECR repositories, and Application Auto Scaling targets/policies.

**examples/config.js** — Sets the `API_URL` to the ALB DNS so the frontend can reach the backend at `/api`.

**examples/Jenkinsfile** — Simple declarative pipeline with Checkout, Build & Push, and Deploy stages.

## Auto Scaling Configuration

- Min capacity: 1
- Desired: 1
- Max capacity: 4
- Target tracking: 50% average CPU utilization

## Jenkins CI/CD

- Jenkins URL: http://localhost:8080
- Pipeline job: `tech-challenge-pipeline`
- Initial admin password was: `7296c5c192a643b29d53da02e76f9d2a`
- Login: admin

## How to Reproduce

1. `cd terraform && terraform init && terraform plan && terraform apply`
2. Build and push Docker images to the ECR repositories created by Terraform.
3. Force a new deployment on both ECS services.
4. Open the ALB URL above to verify the UUID is displayed.
