# Day 2 - Terraform Configuration Language (HCL)

## Overview

After setting up the project in Day 1, today's focus was understanding Terraform Configuration Language (HCL).

HCL is the language used to write Terraform configurations. It is designed to be easy for humans to read while still being structured enough for Terraform to understand.

Most Terraform projects are simply a collection of HCL files that describe the infrastructure you want to create.

---

# Learning Objectives

By the end of Day 2, I wanted to understand:

- How HCL is structured
- How variables work
- Different Terraform data types
- Expressions and built-in functions
- How to write cleaner and more reusable configurations

---

# What is HCL?

HCL stands for HashiCorp Configuration Language.

Unlike programming languages such as Python or Java, HCL is a declarative language.

That means instead of telling Terraform **how** to create infrastructure step by step, you simply describe **what** infrastructure you want, and Terraform figures out the rest.

For example,

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

This block tells Terraform which cloud provider to use.

---

# HCL Building Blocks

Terraform configurations are mainly made up of:

- Blocks
- Arguments
- Expressions

## Block

Blocks define different parts of a Terraform configuration.

Examples include:

- provider
- resource
- variable
- output
- locals

Example:

```hcl
variable "project_name" {
  default = "terraweek"
}
```

---

## Arguments

Arguments assign values inside a block.

Example:

```hcl
default = "terraweek"
```

Here,

`default`

is the argument,

while

`terraweek`

is its value.

---

## Expressions

Expressions calculate values.

Example:

```hcl
upper(var.project_name)
```

Terraform evaluates the expression before using it.

---

# Variables

Variables make Terraform configurations reusable.

Instead of writing:

```hcl
region = "ap-south-1"
```

you can write

```hcl
region = var.aws_region
```

Now the same configuration can be reused for different environments by simply changing the variable value.

---

# Terraform Data Types

Today I explored several data types:

| Type | Example |
|------|---------|
| string | `"AWS"` |
| number | `2` |
| bool | `true` |
| list | `["a","b"]` |
| map | `{ env = "dev" }` |

---

# Locals

Locals help avoid repeating the same values multiple times.

Example:

```hcl
locals {

  environment = "dev"

  resource_name = "${var.project_name}-${local.environment}"

}
```

---

# Built-in Functions

Terraform includes many useful built-in functions.

Some examples I explored today:

- upper()
- lower()
- length()

Using functions keeps configurations cleaner and more dynamic.

---

# Files Created

- variables.tf
- terraform.tfvars
- locals.tf
- outputs.tf
- examples.tf

---

# Key Takeaways

- HCL is simple to read and write.
- Variables make configurations reusable.
- Data types help validate input values.
- Expressions and functions make Terraform configurations more flexible.
- Locals help reduce repetition.

---

# What's Next?

In Day 3, I'll start using these concepts to build actual infrastructure with Terraform.
