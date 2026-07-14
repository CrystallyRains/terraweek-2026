# 🚀 TerraWeek Challenge - Day 3

## Overview

After learning the basics of Terraform and understanding HCL in the previous two days, today's focus was on **Resources**—the core building blocks of every Terraform configuration.

A Terraform configuration can contain variables, outputs, expressions, and many other components, but at the end of the day, the main purpose of Terraform is to create and manage infrastructure. Every AWS EC2 instance, S3 bucket, VPC, Security Group, or IAM Role that Terraform manages is represented using a **resource block**.

Today's goal wasn't just to create an AWS resource but also to understand how Terraform manages resources, identifies dependencies between them, and controls their lifecycle.

---

# 🎯 Learning Objectives

By the end of Day 3, I wanted to understand:

- How to define and manage resources using Terraform.
- The structure of a Terraform resource block.
- Different resource types available across cloud providers.
- How Terraform determines the order of resource creation.
- Resource dependencies (implicit and explicit).
- Lifecycle meta-arguments.
- Provisioners and when they should (and shouldn't) be used.

---

# ☁️ What is a Resource?

A resource represents a piece of infrastructure that Terraform creates and manages.

Whether you're creating:

- an EC2 instance
- an S3 bucket
- a VPC
- a Security Group
- an IAM Role

everything starts with a **resource block**.

Think of resources as the "building blocks" of your cloud infrastructure.

---

# 🏗️ Anatomy of a Resource Block

Every Terraform resource follows a similar structure.

```hcl
resource "aws_instance" "web_server" {

  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "TerraWeek-EC2"
  }

}
```

Let's break this down.

### `resource`

This tells Terraform that we're defining a new resource.

---

### `aws_instance`

This is the **resource type**.

It tells Terraform what kind of infrastructure to create.

Examples include:

- `aws_instance`
- `aws_s3_bucket`
- `aws_security_group`
- `aws_vpc`

---

### `web_server`

This is the local name of the resource.

Terraform uses this name to reference the resource elsewhere in the configuration.

---

### Arguments

Everything inside the resource block is called an **argument**.

Arguments describe how the resource should be created.

Examples include:

- AMI ID
- Instance Type
- Bucket Name
- Tags
- Region

---

# 🌍 Terraform Supports Multiple Cloud Providers

One of the biggest advantages of Terraform is that the same language (HCL) can be used to manage different cloud platforms.

| Cloud Provider | Example Resource |
|----------------|------------------|
| AWS | EC2 Instance, S3 Bucket, VPC |
| Microsoft Azure | Virtual Machine, Storage Account |
| Google Cloud | Compute Engine, Cloud Storage |

Although the resource types change depending on the provider, the overall structure remains very similar.

---

# 🔗 Understanding Resource Dependencies

One of the concepts that stood out to me today was how Terraform figures out the order in which resources should be created.

Imagine you're building a house.

You can't build the roof before the walls.

Similarly, in cloud infrastructure, some resources depend on others.

For example, an EC2 instance may need a Security Group before it can be launched.

Instead of asking us to manually define the order, Terraform builds something called a **dependency graph**.

This graph helps Terraform understand which resources depend on others and determines the correct creation order automatically.

---

# 🤝 Implicit Dependencies

Most of the time, Terraform understands dependencies automatically.

Consider this example:

```hcl
resource "aws_security_group" "web_sg" {
  name = "web-sg"
}

resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

}
```

Notice how the EC2 instance references the Security Group ID.

Because of this reference, Terraform automatically understands that the Security Group must be created first.

This is called an **implicit dependency**, and it's the most common type of dependency you'll work with.

---

# 📌 Explicit Dependencies

Sometimes Terraform cannot determine the dependency automatically because there is no direct reference between two resources.

In those situations, we can use the `depends_on` meta-argument.

```hcl
resource "null_resource" "configure_server" {

  depends_on = [
    aws_instance.web
  ]

}
```

This explicitly tells Terraform to create the EC2 instance before executing the `null_resource`.

As a best practice, `depends_on` should only be used when Terraform cannot infer the dependency on its own.

---

# 🔄 Lifecycle Meta-Arguments

Terraform also provides lifecycle settings that control how resources are managed.

Some commonly used lifecycle rules include:

### `prevent_destroy`

Protects important resources from being accidentally deleted.

Useful for production databases or storage buckets.

---

### `create_before_destroy`

Creates the replacement resource before deleting the old one.

This helps reduce downtime during updates.

---

### `ignore_changes`

Tells Terraform to ignore changes made to specific attributes outside Terraform.

This is useful when another service or team manages part of a resource.

---

# ⚙️ Provisioners

Provisioners allow Terraform to execute scripts after a resource has been created.

Some examples include:

- `local-exec`
- `remote-exec`

While they can be useful in certain scenarios, HashiCorp recommends using them only when necessary.

In many cases, tools like cloud-init, configuration management tools, or CI/CD pipelines provide a cleaner and more maintainable solution.

---

# 📂 Files Used

```
day-03/
├── provider.tf
├── versions.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
└── README.md
```

---

# 💻 Terraform Commands Used

```bash
terraform init
```

Initializes the working directory and downloads the required providers.

---

```bash
terraform validate
```

Checks whether the Terraform configuration is valid.

---

```bash
terraform fmt
```

Formats Terraform files using the standard style.

---

```bash
terraform plan
```

Shows what Terraform plans to create, modify, or destroy before making any changes.

---

```bash
terraform apply
```

Creates or updates infrastructure based on the execution plan.

---

# 💡 Key Takeaways

- Resources are the foundation of every Terraform project.
- Every resource follows a consistent structure, making Terraform easier to learn.
- Terraform automatically builds a dependency graph to determine the correct resource creation order.
- Most dependencies are handled automatically through resource references.
- `depends_on` is available when Terraform cannot infer dependencies.
- Lifecycle rules provide additional control over how Terraform manages resources.
- Provisioners exist but should be used thoughtfully.

---

# 📚 References

- Terraform Documentation: https://developer.hashicorp.com/terraform/docs
- AWS Provider Documentation: https://registry.terraform.io/providers/hashicorp/aws/latest/docs

---

## 🚀 What's Next?

In Day 4, I'll continue building on these concepts by exploring Terraform State and understanding how Terraform keeps track of the infrastructure it manages.
