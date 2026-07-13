# TerraWeek Challenge - Day 1

## Overview

For Day 1 of the #TerraWeekChallenge, the goal was to understand the basics of Infrastructure as Code (IaC), learn the core concepts of Terraform, and set up a clean Terraform project that I'll continue building throughout this challenge.

---

## What is Infrastructure as Code (IaC)?

Infrastructure as Code (IaC) is the practice of creating and managing infrastructure using code instead of manually creating resources through a cloud console.

Instead of clicking through the AWS Console every time you need a resource, you define it in code. This makes infrastructure easier to manage, reuse, and track using version control.

Some benefits of IaC include:

- Faster deployments
- Consistent environments
- Reduced manual errors
- Easier collaboration using Git

---

## Why Terraform?

Terraform is an open-source Infrastructure as Code tool developed by HashiCorp.

One of the biggest reasons it's so popular is that the same Terraform code can be used with different cloud providers like AWS, Azure, and Google Cloud by simply changing the provider configuration.

Terraform uses **HCL (HashiCorp Configuration Language)**, which is designed to be easy to read and write.

---

## Terraform Components I Learned

Before writing any infrastructure, I spent some time revisiting the main building blocks of Terraform.

| Component | Purpose |
|-----------|---------|
| Provider | Connects Terraform to a cloud platform like AWS |
| Resource | Defines the infrastructure Terraform should create |
| Variables | Makes the configuration reusable by avoiding hardcoded values |
| Outputs | Displays useful information after Terraform finishes |
| State | Keeps track of the infrastructure managed by Terraform |

---

## Project Structure

For today's setup, I organized the project into separate files instead of putting everything inside one file.

```text
.
├── provider.tf
├── versions.tf
├── variables.tf
├── outputs.tf
├── .gitignore
└── README.md
```

### File Overview

**versions.tf**

Defines the required Terraform version and AWS provider version.

**provider.tf**

Contains the AWS provider configuration.

**variables.tf**

Stores input variables that can be reused later in the project.

**outputs.tf**

Will be used to display useful information after resources are created.

---

## Commands Used

### Initialize Terraform

```bash
terraform init
```

Downloads the required provider plugins and prepares the project to use Terraform.

### Validate Configuration

```bash
terraform validate
```

Checks whether the Terraform configuration is valid.

### Format Terraform Files

```bash
terraform fmt
```

Formats the Terraform files to keep the code clean and consistent.

---

## One Thing I Revisited Today

While setting up the project, I was reminded why it's important to keep a Terraform repository clean.

The `.terraform/` directory contains downloaded provider plugins and other local files. Since Terraform creates these automatically when you run `terraform init`, they don't need to be committed to Git.

The `.terraform.lock.hcl` file is different. I make sure to commit it because it locks the provider versions, so everyone working on the project uses the same versions.

---

## What's Next?

Day 1 was all about building a solid foundation.

In Day 2, I'll start working with Terraform variables and learn how they make configurations more flexible and reusable.

---

## Screenshots

### Terraform Initialization

<img width="1280" height="837" alt="image" src="https://github.com/user-attachments/assets/31b9a995-5adf-4eb4-a785-9ff571565eb7" />
