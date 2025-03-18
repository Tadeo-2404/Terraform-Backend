# Spring Boot Backend Deployment on AWS with Terraform, Docker, Kubernetes, and CI/CD

## Project Overview
This project provides a **cloud-native infrastructure and deployment setup** for a Spring Boot backend, integrating **AWS, Terraform, Docker, Kubernetes, Jenkins, and GitHub Actions** to achieve an automated, scalable, and production-ready environment.

---

## **Current Architecture**

### Backend Service
- Spring Boot application serving as the backend.
- PostgreSQL as the database.
- Docker & Docker Compose for local development.
- Jenkins** automates building and pushing the Docker image to Docker Hub.
- Kubernetes integration for managing deployments.

### Infrastructure (Provisioned with Terraform)
- EC2 Instance (t2.micro)  
  - Currently provisioned to host the application or supporting services.
- AWS VPC with:
  - Public and private subnets** for separating infrastructure components.
  - Internet Gateway & Route Tables for network traffic management.
  - Security Groups configured for TLS traffic.
- Terraform Modules to manage AWS resources.

---

