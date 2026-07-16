# Day 5 - Terraform Modules

## Overview

As Terraform projects grow, keeping everything inside a single `main.tf` file quickly becomes difficult to manage.

Terraform Modules help solve this problem by allowing us to group related resources together and reuse them wherever we need them.

Instead of writing the same infrastructure code again and again, we can write it once, package it as a module, and use it in multiple projects or environments.

Today's goal was to understand how modules work and why they are one of the most important features of Terraform.

---

## What I Learned

### What is a Terraform Module?

A module is simply a collection of Terraform configuration files that work together to create a specific piece of infrastructure.

For example, instead of creating an EC2 instance, security group, and key pair every time, we can put them inside a module and reuse them whenever we need a web server.

Think of it as creating your own reusable building block.

---

### Root Module vs Child Module

Every Terraform project starts with a **Root Module**.

This is the main project where Terraform begins execution.

Whenever we create or use another module inside the project, that becomes a **Child Module**.

Example:

```
Root Module
│
├── main.tf
├── variables.tf
└── modules/
      └── web-server/
```

The Root Module calls the Child Module and passes the required values like AMI ID, instance type, or instance name.

---

### Why Use Modules?

Without modules, we often end up copying the same Terraform code into multiple projects.

That works for small projects, but it quickly becomes difficult to maintain.

Modules allow us to:

- Avoid writing duplicate code
- Keep projects organized
- Reuse infrastructure easily
- Make changes in one place instead of many

This makes Terraform projects much easier to maintain as they grow.

---

### Passing Values to a Module

Just like resources can use variables, modules can too.

The Root Module passes values to the Child Module using input variables.

Example:

```hcl
module "web_server" {
  source = "./modules/web-server"

  ami_id        = var.ami_id
  instance_type = var.instance_type
}
```

The module then uses these values to create the required infrastructure.

---

### Module Outputs

Modules can also return information back to the Root Module.

For example:

- EC2 Instance ID
- Public IP Address
- Security Group ID

These outputs can then be used elsewhere in the project.

---

### Local Modules

Local modules are modules that we create ourselves inside our project.

Example:

```hcl
module "web_server" {
  source = "./modules/web-server"
}
```

This tells Terraform to use the module stored inside the `modules` folder.

---

### Terraform Registry Modules

One thing I really like about Terraform is that not every module has to be written from scratch.

Terraform Registry provides thousands of ready-to-use modules built and maintained by HashiCorp and the community.

Need a VPC?

Need an EC2 instance?

Need an EKS cluster?

There's a good chance someone has already built a well-tested module for it.

Instead of writing everything yourself, you can simply reference the module, provide a few input variables, and use it in your own project.

That's one of the reasons Terraform scales so well for larger projects.

---

## Project Structure

```
day-05-terraform-modules/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── versions.tf
│
└── modules/
    └── web-server/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## Key Takeaways

- Modules help organize Terraform projects.
- They reduce duplicate code.
- The same module can be reused across multiple environments.
- Modules can accept input variables and return outputs.
- You can create your own modules or use existing ones from Terraform Registry.
- Using modules makes Terraform projects easier to maintain and scale.

---

## References

- Terraform Documentation
- Terraform Registry
