# Day 4 - Terraform State Management

## Overview

When you run Terraform, it needs a way to remember the infrastructure it has already created.

That's where the **Terraform state file** comes in.

The state file acts as Terraform's source of truth. It stores information about your infrastructure so Terraform knows what already exists, what has changed, and what needs to be created, updated, or removed during the next deployment.

Without a state file, Terraform would have no reliable way to compare your configuration with the actual infrastructure.

---

## What I Learned

During Day 4 of the TerraWeek Challenge, I explored:

- What Terraform state is and why it is important.
- Local vs Remote state.
- Why remote state is recommended for team environments.
- How Amazon S3 can be used as a remote backend.
- How Terraform prevents multiple people from modifying the same infrastructure at the same time using state locking.

---

## What is Terraform State?

Whenever Terraform creates infrastructure, it generates a file called:

```text
terraform.tfstate
```

This file stores details about the resources Terraform manages, including things like:

- Resource IDs
- Resource attributes
- Metadata
- Dependencies

Terraform reads this file every time you run commands like:

```bash
terraform plan
terraform apply
terraform destroy
```

This allows Terraform to compare the current infrastructure with your configuration and determine exactly what needs to change.

---

## Local State

By default, Terraform stores the state file locally.

Example:

```text
terraform.tfstate
```

This works well when you're learning Terraform or working alone.

However, local state has several limitations:

- It only exists on one machine.
- It can be accidentally deleted.
- Team members cannot share the same state.
- Multiple people could make conflicting changes.

---

## Remote State

For real-world projects, Terraform state is usually stored remotely.

Common remote backend options include:

- Amazon S3
- Terraform Cloud
- HashiCorp Consul

Using a remote backend provides several benefits:

- Shared state across the team.
- Centralized storage.
- Better reliability.
- Easier collaboration.
- Support for state locking.

---

## Why State Locking Matters

Imagine two engineers running:

```bash
terraform apply
```

at the same time.

Without state locking:

- One deployment could overwrite another.
- The state file could become inconsistent.
- Infrastructure changes could fail or be lost.

State locking ensures that only one Terraform operation can modify the state at a time.

Everyone else waits until the current operation finishes.

---

## A New Thing I Learned

One thing I found particularly interesting is that newer versions of Terraform have simplified state locking.

For a long time, the recommended AWS setup was:

- Amazon S3 for storing the state file.
- Amazon DynamoDB for state locking.

Starting with **Terraform v1.10**, Amazon S3 supports **native state locking**.

Instead of creating a separate DynamoDB table, you can simply enable:

```hcl
use_lockfile = true
```

This makes the backend configuration simpler while still preventing concurrent Terraform operations.

Many existing projects still use DynamoDB, but for newer Terraform versions, native S3 locking is often all that's needed.

---

## Example Remote Backend

```hcl
terraform {
  backend "s3" {
    bucket       = "my-terraform-state"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}
```

---

## Key Takeaways

- Terraform uses a state file to keep track of infrastructure.
- Local state is useful for learning but isn't ideal for teams.
- Remote state improves collaboration and reliability.
- State locking prevents multiple users from modifying infrastructure simultaneously.
- Native S3 state locking makes backend configuration simpler in newer Terraform versions.

---

## Repository

This folder contains my notes and examples from **Day 4** of the TerraWeek Challenge.

The goal wasn't just to configure a backend, but to understand **why Terraform state exists and how it helps manage infrastructure safely.**
