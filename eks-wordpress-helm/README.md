# EKS WordPress Deployment with Helm

A hands-on project that deploys a WordPress microservice to Amazon EKS using Helm, with Horizontal Pod Autoscaling. Demonstrates EKS cluster provisioning, managed node groups, Helm chart customization, troubleshooting, and autoscaling on AWS.

## Technologies

- Amazon EKS
- eksctl
- kubectl
- Helm
- Kubernetes
- AWS EC2 (t3.micro)
- PowerShell
- YAML

## What I Did

- Provisioned an Amazon EKS cluster with a managed node group using eksctl
- Selected t3.micro to stay within Free Tier eligibility
- Installed the Amazon VPC CNI addon so nodes could become Ready
- Installed Helm and created a custom chart for WordPress
- Overrode the default nginx image with the official WordPress image
- Changed the Service type to LoadBalancer
- Diagnosed and fixed liveness/readiness probe failures that caused CrashLoopBackOff
- Verified the application was healthy using kubectl port-forward
- Created a Horizontal Pod Autoscaler (min 1, max 10, 50% CPU target)
- Documented common errors and their fixes

## Project Structure

```
eks-wordpress-helm/
├── my-microservice/          # Helm chart
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
├── screenshots/              # Key verification screenshots
└── README.md
```

## Key Files

**values.yaml** — Overrides the container image to `wordpress:latest` and sets the Service type to `LoadBalancer`. Liveness and readiness probes were commented out to prevent CrashLoopBackOff during WordPress startup.

**Chart.yaml** — Defines the Helm chart metadata.

**templates/** — Kubernetes manifests (Deployment, Service) rendered by Helm.

## Verification

- `kubectl get nodes` showed the worker node as Ready
- `helm install` returned STATUS: deployed
- `kubectl get pods` showed 1/1 Ready after probe fixes
- WordPress setup page loaded via `kubectl port-forward` at `http://localhost:8080`
- `kubectl get hpa` confirmed the autoscaler (min 1 / max 10)

## Notes

- External access through the Classic LoadBalancer hostname remained unreliable (target stayed Out-of-service). The application itself was confirmed healthy via port-forward.
- All AWS resources were deleted after documentation to avoid ongoing charges.
