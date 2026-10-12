# Dockerized Flask Application with Kubernetes

A hands-on project that containerizes a Python Flask web application with Docker and deploys it to a local Kubernetes cluster. Demonstrates container packaging, image building, orchestration, scaling, and service exposure.

## Technologies

- Docker
- Docker Desktop
- Kubernetes
- kubectl
- Python
- Flask
- NGINX
- YAML
- PowerShell

## What I Did

- Created a simple Flask application that returns a custom message
- Wrote a Dockerfile to package the app with its dependencies
- Built a Docker image and ran the container with port mapping
- Verified the application in a browser
- Enabled a local Kubernetes cluster in Docker Desktop
- Wrote a Kubernetes Deployment that runs multiple replicas of NGINX
- Created a Service to expose the application
- Scaled the Deployment from 2 to 3 replicas
- Used port-forward for local access on a Docker Desktop cluster

## Project Structure

```
docker-kubernetes-flask/
├── app.py                 # Flask application
├── requirements.txt       # Python dependencies
├── Dockerfile             # Container build instructions
├── deployment.yaml        # Kubernetes Deployment
├── service.yaml           # Kubernetes Service
└── README.md
```

## Key Files

**app.py** — Minimal Flask app listening on `0.0.0.0:5000` so it is reachable from outside the container.

**Dockerfile** — Uses `python:3.12-slim`, installs dependencies, and starts the app.

**deployment.yaml** — Runs NGINX with a configurable replica count and proper labels.

**service.yaml** — LoadBalancer Service that selects the NGINX pods.

## Skills Demonstrated

- Containerizing a Python application
- Writing and building Dockerfiles
- Running and inspecting containers
- Kubernetes Deployments and Services
- Scaling workloads
- Local cluster setup with Docker Desktop
- Basic troubleshooting (PATH, port-forward)

## Notes

No cloud credentials, private keys, or sensitive data are included. The Kubernetes portion was completed on a local Docker Desktop cluster.
