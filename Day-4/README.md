# Day 4 - Terraform State Management

## What I Learned

Today's topic was Terraform State Management.

Until now, I had been creating resources with Terraform, but I never really stopped to think about how Terraform remembers everything it creates. That's what today's learning was all about.

---

## What is Terraform State?

Whenever Terraform creates infrastructure, it also creates a file called `terraform.tfstate`.

This file stores information about all the resources Terraform manages.

For example, if Terraform creates an EC2 instance today and I run `terraform apply` again tomorrow, Terraform needs to know that the EC2 instance already exists. Instead of creating another one, it compares my configuration with the state file and only makes the changes that are needed.

Without the state file, Terraform wouldn't know what infrastructure it is managing.

---

## Local State

By default, Terraform stores the state file locally on your machine.

This is completely fine when you're learning Terraform or working on personal projects.

However, local state has a few limitations:

- Only your machine has the latest state.
- If the file is deleted, managing the infrastructure becomes difficult.
- Team members cannot share the same state.
- Multiple people can accidentally make changes at the same time.

---

## Remote State

In real-world projects, the state file is usually stored remotely so everyone works with the same source of truth.

Some common remote backends are:

- Amazon S3
- Terraform Cloud
- HashiCorp Consul

For AWS projects, Amazon S3 is one of the most common choices because it's simple, reliable, and easy to set up.

A basic backend configuration looks like this:

```hcl
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
```

---

## Why State Locking is Important

Imagine two people running `terraform apply` at the same time.

Both of them would try to update the same state file, which could lead to failed deployments or an inconsistent state.

State locking prevents this by allowing only one Terraform operation to update the state at a time.

The second person simply waits until the first operation finishes.

---

## One New Thing I Learned Today

This was probably my favorite part of today's learning.

For a long time, the common setup on AWS was:

- Amazon S3 to store the Terraform state.
- Amazon DynamoDB to handle state locking.

But starting with Terraform v1.10, S3 supports native state locking.

That means you can simply enable:

```hcl
use_lockfile = true
```

and Terraform can handle state locking without needing a separate DynamoDB table.

Many existing projects still use DynamoDB, especially if they were created before this feature was introduced. But for newer projects, using S3 with `use_lockfile = true` makes the backend setup much simpler.

---

## Key Takeaways

- Terraform uses a state file to remember the infrastructure it manages.
- By default, the state file is stored locally.
- Remote state is a better option when multiple people are working on the same project.
- State locking prevents multiple users from modifying the state at the same time.
- Newer versions of Terraform support native state locking with Amazon S3, removing the need for a separate DynamoDB table in many cases.

---

## Files in this Folder

- Backend configuration example
- Notes from Day 4 of the TerraWeek Challenge
- Sample Terraform state management configuration
