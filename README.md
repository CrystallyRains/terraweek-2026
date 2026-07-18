# TerraWeek 2026 - My Terraform Learning Journey 💫

This repository documents my journey through the **TrainWithShubham TerraWeek Challenge 2026**, where I spent a week learning Terraform by building infrastructure step by step instead of jumping straight into large projects.

Rather than treating each day as a separate exercise, I wanted this repository to become a learning resource that someone new to Terraform could follow from the basics to a complete infrastructure project.

By the end of the challenge, I had explored how Terraform works internally, how it manages infrastructure safely, and how to structure Terraform projects using practices that are commonly followed in real DevOps teams.

---

## About the Challenge

The TerraWeek Challenge focused on learning Terraform incrementally.

Each day introduced a new concept that built on the previous one, starting with the basics of Infrastructure as Code and ending with a complete capstone project.

Throughout the challenge I shared my learnings publicly on LinkedIn while maintaining this GitHub repository alongside it.

---

# What You'll Learn

This repository covers topics including:

- Understanding Infrastructure as Code (IaC)
- Terraform installation and project setup
- Terraform Configuration Language (HCL)
- Providers and Resources
- Variables and Outputs
- Managing Infrastructure State
- Remote State using Amazon S3
- State Locking
- Terraform Modules
- Registry Modules
- Workspaces
- Terraform Testing
- Security Scanning
- CI/CD with GitHub Actions
- Terraform Best Practices
- Building a complete Terraform project

Whether you're completely new to Terraform or looking for a structured walkthrough, the repository is designed so you can follow along one day at a time.

---

# Repository Structure

```
TerraWeek/
│
├── day01/   → Terraform setup and fundamentals
├── day02/   → Terraform configuration language (HCL)
├── day03/   → Managing infrastructure with resources
├── day04/   → Terraform state and remote backend
├── day05/   → Terraform modules
├── day06/   → Advanced Terraform + Capstone Project
│
└── README.md
```

Each folder contains the code, notes, and README for that day's learning.

---

# Capstone Project

Everything learned throughout the week comes together in **Day 6**.

The capstone project demonstrates how to build AWS infrastructure using modern Terraform practices including:

- Custom modules
- Registry modules
- Remote state
- Workspaces
- Native Terraform testing
- Security scanning
- GitHub Actions CI
- Production-oriented project structure

👉 **Open the Day 6 folder to explore the complete project and detailed documentation.**

---

# Why This Repository Exists

When I started learning Terraform, I noticed that many tutorials explain *what commands to run*, but not *why Terraform behaves the way it does.*

My goal with this repository was to document not only the commands I used, but also the reasoning behind concepts like state management, modules, providers, workspaces, and testing.

Hopefully, it makes Terraform a little easier to understand for the next person learning it.

---

# Tech Stack

- Terraform
- AWS
- Amazon EC2
- Amazon VPC
- Amazon S3
- GitHub Actions
- Trivy

---

# Related Posts

Throughout TerraWeek, I also documented my daily learnings on LinkedIn as part of the Learn in Public challenge.

---

If you find this repository useful, feel free to explore the project, try it yourself, or use it as a reference while learning Terraform.

Happy Terraforming!
