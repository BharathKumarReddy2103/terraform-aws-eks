# terraform-aws-eks

Production-grade Terraform code for provisioning AWS EKS clusters and related infrastructure for the [Roboshop Application](https://github.com/BharathKumarReddy2103/roboshop-docker)—a microservices-based e-commerce platform for selling robots.

## Overview

This repository automates the deployment of a robust AWS environment for Roboshop, including:

- **VPC Configuration**: Custom Virtual Private Cloud setup for network isolation.
- **Security Groups**: Fine-grained access control for EKS and supporting resources.
- **Bastion Host**: Secure SSH access for administration.
- **AWS Certificate Manager (ACM)**: SSL/TLS certificate provisioning for secure endpoints.
- **Frontend Application Load Balancer (ALB)**: Ingress ALB setup for routing traffic to frontend services.
- **Elastic Kubernetes Service (EKS)**: Fully managed Kubernetes cluster creation.
- **Elastic Container Registry (ECR)**: Private container image registry for application deployments.

## Features

- Modular, reusable Terraform code.
- Supports multi-AZ deployment for high availability.
- Integrates with AWS best practices for security and scalability.
- Designed for production workloads.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- AWS CLI configured with sufficient permissions
- [kubectl](https://kubernetes.io/docs/tasks/tools/) for EKS management
- [Helm](https://helm.sh/) (optional, for app deployment)

## Usage

### 1. Clone the repository

```bash
git clone https://github.com/BharathKumarReddy2103/terraform-aws-eks.git
cd terraform-aws-eks
```

### 2. Configure variables

Edit `terraform.tfvars` or the relevant variable files to set values for your AWS account, region, and Roboshop-specific settings.

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Plan the deployment

```bash
terraform plan
```

### 5. Apply the deployment

```bash
terraform apply
```

### 6. Access EKS Cluster

After successful deployment, update your kubeconfig:

```bash
aws eks update-kubeconfig --name <eks_cluster_name> --region <region>
```

## Directory Structure

```
terraform-aws-eks/
├── 00-vpc/            # VPC configuration (networking)
├── 10-sg/             # Security Group definitions
├── 20-bastion/        # Bastion host setup for SSH access
├── 30-ecr/            # Elastic Container Registry (ECR) resources
├── 60-acm/            # AWS Certificate Manager (ACM) for SSL/TLS
├── 70-frontend-alb/   # Frontend Application Load Balancer (ALB) setup
├── 80-eks/            # Elastic Kubernetes Service (EKS) cluster resources
```

## Resources Created

- VPC with public and private subnets
- Security groups for EKS, ALB, bastion, etc.
- Bastion EC2 instance for admin access
- ACM certificate for HTTPS endpoints
- Application Load Balancer (ALB) for frontend ingress
- EKS cluster with node groups
- ECR registry for container images

## Customization

You can customize resource sizes, networking, security, and other settings via `variables.tf` and `terraform.tfvars`.

## Clean Up

To destroy all resources created by this Terraform configuration:

```bash
terraform destroy
```

## Support & Contributions

- Issues and PRs are welcome!
- For questions, open a [GitHub Issue](https://github.com/BharathKumarReddy2103/terraform-aws-eks/issues).

## License

This project is licensed under the [MIT License](LICENSE).

---

**Author:** [BharathKumarReddy2103](https://github.com/BharathKumarReddy2103)