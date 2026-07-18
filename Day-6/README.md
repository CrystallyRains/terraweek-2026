# Terraform Capstone Project

This project is the final capstone of the **TrainWithShubham TerraWeek Challenge**. It brings together everything covered throughout the week into one practical Terraform project that demonstrates how real-world infrastructure can be managed using Infrastructure as Code (IaC).

Instead of building a large AWS environment, the focus of this project is on writing clean, reusable, and maintainable Terraform code. You'll learn not only how to provision AWS resources, but also how to organize Terraform projects, manage state safely, reuse modules, test configurations, and automate deployments.

Whether you're just starting with Terraform or revising the fundamentals, this project is designed to help you understand **why Terraform works the way it does**, not just which commands to run.

---

# What You'll Build

The project provisions a small AWS environment consisting of:

- A custom Amazon VPC
- A public subnet
- Internet Gateway
- Route Table
- EC2 instance
- Security Group
- Remote Terraform state stored in Amazon S3
- Multiple environments using Terraform Workspaces

Although the infrastructure itself is intentionally simple, the engineering practices used throughout the project closely resemble those used in production environments.

---

# Technologies Used

This project uses the following tools and services:

- Terraform
- AWS Provider
- Amazon EC2
- Amazon VPC
- Amazon S3 (Remote Backend)
- Terraform Registry Modules
- GitHub Actions
- Trivy

---

# Architecture

```text
                           GitHub Repository
                                  │
                         GitHub Actions (CI)
       fmt → validate → test → Trivy Scan → terraform plan
                                  │
                            Terraform CLI
                                  │
                            AWS Provider
                                  │
                      Amazon S3 Remote Backend
                       (Native State Locking)
                                  │
        ┌─────────────────────────┴─────────────────────────┐
        │                                                   │
 Custom Networking Module                          Custom Compute Module
        │                                                   │
 VPC • Subnet • IGW                              EC2 + user_data
 Route Table                                            │
        └───────────────────────┬─────────────────────────┘
                                │
        Registry Module (terraform-aws-modules/security-group/aws)
```

---

# Features

This project demonstrates:

- Infrastructure as Code using Terraform
- Custom Terraform Modules
- Terraform Registry Modules
- Remote State using Amazon S3
- Native S3 State Locking
- Multiple Environments with Workspaces
- Native Terraform Testing
- GitHub Actions CI/CD
- Security Scanning with Trivy
- Version Pinning
- Infrastructure Validation
- Clean Project Structure

---

# Project Structure

```text
day06/
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── modules/
│   ├── networking/
│   └── compute/
│
├── tests/
│   └── basic.tftest.hcl
│
├── backend.tf
├── versions.tf
├── providers.tf
├── locals.tf
├── variables.tf
├── outputs.tf
├── main.tf
├── terraform.tfvars.example
├── .gitignore
└── README.md
```

---

# Terraform Concepts Explained

## Providers

Terraform communicates with cloud platforms through providers.

This project uses the AWS Provider, which allows Terraform to provision AWS resources such as VPCs, EC2 instances, and Security Groups.

---

## Terraform State

Terraform keeps track of everything it creates using a **state file**.

Instead of querying AWS every time, Terraform reads the state file to understand which resources already exist and what needs to change.

Without state, Terraform wouldn't know whether a resource should be created, updated, or deleted.

---

## Remote State

Keeping the state file on your laptop works for personal experiments, but it doesn't scale when multiple people work on the same infrastructure.

For that reason this project stores the state remotely in Amazon S3.

Using remote state provides:

- A single source of truth
- Shared infrastructure state
- Better collaboration
- Easier recovery

---

## Native State Locking

Older Terraform projects commonly used DynamoDB for state locking.

Terraform now supports **native S3 state locking** using:

```hcl
use_lockfile = true
```

This removes the need for a separate DynamoDB table while still preventing concurrent Terraform operations.

---

## Modules

Terraform Modules allow infrastructure to be reused instead of copied.

This project includes two custom modules:

- **networking**
- **compute**

Each module has its own variables, resources, and outputs, making the infrastructure easier to maintain and extend.

---

## Registry Modules

Writing every Terraform resource manually isn't always necessary.

For the Security Group, this project uses the official community module:

```
terraform-aws-modules/security-group/aws
```

The Terraform Registry provides thousands of reusable modules maintained by both HashiCorp and the community.

In this project, the official Security Group module from the Registry is used instead of creating every security group resource manually. This helps reduce boilerplate while following community best practices.

---

## Workspaces

The same Terraform code can deploy different environments.

This project uses Terraform Workspaces so that different environments can use different instance sizes.

Example:

| Workspace | Instance Type |
|------------|---------------|
| dev | t2.micro |
| prod | t3.small |

---

## Native Terraform Testing

Terraform now includes its own testing framework.

Instead of creating real infrastructure, the included tests validate the Terraform configuration during the planning phase.

This helps catch mistakes before resources are created.

---

## GitHub Actions

Every push automatically runs:

- terraform fmt
- terraform validate
- terraform test
- Trivy Security Scan
- terraform plan

This workflow acts as an automated quality check. Every infrastructure change is formatted, validated, tested, scanned for common security issues, and finally planned before it reaches AWS.

---

## Security Scanning

Infrastructure code should be scanned just like application code.

This project uses **Trivy** to identify common security issues before infrastructure is deployed.

---

# Getting Started

## Prerequisites

Before running the project you'll need:

- Terraform 1.10+
- AWS CLI
- AWS Account
- Configured AWS credentials
- Amazon S3 bucket for remote state

---

## Clone the Repository

```bash
git clone <repository-url>

cd day06
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Create a Workspace

```bash
terraform workspace new prod

terraform workspace select prod
```

---

## Validate the Configuration

```bash
terraform fmt -recursive

terraform validate

terraform test
```

---

## Preview Infrastructure

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

---

## View Outputs

```bash
terraform output
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

# Best Practices Implemented

- Remote State using Amazon S3

- Native State Locking

- Version Pinning

- Custom Modules

- Registry Modules

- Workspaces

- Native Terraform Tests

- GitHub Actions CI

- Security Scanning

- No Hardcoded Secrets

- Infrastructure Validation
  
- Version Control with Git and GitHub

---

# What You'll Learn

By completing this project you'll gain practical experience with:

- Infrastructure as Code
- AWS Providers
- Terraform State
- Remote Backends
- Modules
- Registry Modules
- Workspaces
- Terraform Testing
- GitHub Actions
- Infrastructure Security
- Terraform Project Structure

These concepts form the foundation of how many DevOps teams manage cloud infrastructure today.

---

# Cleanup

When you're finished experimenting with the project, remember to remove all created resources.

```bash
terraform destroy
```

This prevents unnecessary AWS charges and keeps your AWS account clean.

---

# Final Thoughts

This capstone project brings together everything learned throughout TerraWeek into a single Terraform project.

The infrastructure itself is intentionally small so the focus stays on learning Terraform's core concepts and recommended practices. Once you're comfortable with this foundation, you can easily extend the same structure to build much larger cloud environments.

Happy Terraforming!
