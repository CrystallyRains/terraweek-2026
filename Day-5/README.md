# Day 5 - Terraform Modules

## Overview

As Terraform projects grow, keeping all the resources inside a single `main.tf` file becomes difficult to manage.

Imagine creating an EC2 instance, Security Group, IAM Role, and Key Pair for one project. Then you need the same setup for another project. Copying the same code again and again works at first, but after a while it becomes difficult to maintain.

Terraform Modules solve this problem.

A module lets us group related resources together so they can be reused whenever we need them. Instead of writing the same infrastructure multiple times, we write it once and use it wherever it's needed.

Today's goal was to understand how modules work, create one from scratch, and see why they're such an important part of Terraform.

---

# Why Do We Need Modules?

Without modules, infrastructure code quickly becomes repetitive.

For example, imagine you're creating three environments:

- Development
- Staging
- Production

Each environment needs:

- EC2 Instance
- Security Group
- SSH Key Pair

Without modules, you might copy the same Terraform code three different times.

Now imagine you want to change one Security Group rule.

You have to update it in every project.

Modules solve this by letting us write the infrastructure once and reuse it multiple times.

This makes projects easier to maintain and much easier to scale.

---

# What is a Terraform Module?

A Terraform Module is simply a collection of Terraform configuration files that work together to create a specific piece of infrastructure.

Instead of creating resources one by one every time, we group them into a module.

For example, a **Web Server Module** could contain:

- EC2 Instance
- Security Group
- SSH Key Pair

Whenever we need another web server, we simply call the module instead of rewriting all those resources.

Think of a module as a reusable building block.

---

# Root Module vs Child Module

Every Terraform project starts with a **Root Module**.

This is the directory where Terraform commands like `terraform init` and `terraform apply` are executed.

When the Root Module calls another module, that becomes a **Child Module**.

Example:

```
Root Module
│
├── main.tf
├── variables.tf
├── outputs.tf
│
└── modules/
    └── web-server/
```

The Root Module controls the project.

The Child Module contains reusable infrastructure.

---

# How Modules Work

Terraform first reads the Root Module.

When it finds a module block, it:

1. Loads the module.
2. Passes the required input values.
3. Creates the resources inside the module.
4. Returns any outputs back to the Root Module.

This allows the Root Module to stay clean while the module handles the actual infrastructure.

---

# Passing Values to Modules

Modules become flexible because they can accept input variables.

Instead of hardcoding values inside the module, we pass them from the Root Module.

Example:

```hcl
module "web_server" {
  source = "./modules/web-server"

  ami_id          = var.ami_id
  instance_type   = var.instance_type
  instance_name   = var.instance_name
  public_key_path = var.public_key_path
}
```

The same module can now be used with different AMIs, instance types, or names without changing the module itself.

---

# Module Outputs

Modules can also return information back to the Root Module.

For example:

- Instance ID
- Public IP
- Security Group ID

Example:

```hcl
output "public_ip" {
  value = aws_instance.web.public_ip
}
```

The Root Module can then use these outputs elsewhere in the project.

---

# Local Modules

Local Modules are modules that we create ourselves inside our project.

Example:

```hcl
module "web_server" {
  source = "./modules/web-server"
}
```

Terraform looks inside the `modules` folder and loads the module from there.

This is useful when building reusable components for your own projects.

---

# Terraform Registry

One thing I really like about Terraform is that you don't always have to build every module yourself.

Terraform Registry provides thousands of ready-to-use modules built and maintained by HashiCorp and the community.

Need a VPC?

Need an EC2 Instance?

Need an EKS Cluster?

Need an RDS Database?

There's a good chance someone has already built a well-tested module that you can use.

Instead of writing everything from scratch, you simply reference the module, provide a few input variables, and Terraform does the rest.

The best part is that using a Registry module feels almost the same as using your own local module.

That consistency is one of the things I like most about Terraform's design.

---

# Module Versioning

When using Registry modules, it's a good practice to specify the module version.

Example:

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"
}
```

Pinning the version ensures everyone working on the project uses the same module version.

Without versioning, future updates could introduce unexpected changes.

---

# What I Built Today

For today's challenge, I refactored the infrastructure created in the previous days into a reusable module.

Instead of defining the EC2 Instance, Security Group, and SSH Key Pair directly inside the Root Module, I moved them into a separate **web-server** module.

The Root Module now only needs to call the module and pass the required input values.

This made the project much cleaner and showed how modules help organize Terraform code as projects grow.

---

# Project Structure

```
day-05-terraform-modules/
│
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── versions.tf
│
└── modules/
    └── web-server/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

# Key Takeaways

- Modules help organize Terraform projects.
- They reduce duplicate code.
- Input variables make modules reusable.
- Outputs allow modules to share information.
- You can build your own modules or use modules from Terraform Registry.
- Modules make Terraform projects easier to maintain and scale.
- The same module can be reused across multiple environments without rewriting infrastructure.

---

# References

- Terraform Documentation
- Terraform Registry
