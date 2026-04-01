<!-- Banner -->

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=28&pause=1000&color=7B42BC&center=true&vCenter=true&width=600&lines=Terraform+AWS+Infrastructure;Multi-Environment+IaC;Dev+%7C+Staging+%7C+Production" alt="Typing SVG" />

<br/>

# 🏗️ Terraform AWS — Multi-Environment Infrastructure

**A hands-on DevOps project demonstrating real-world Terraform patterns**

`modular architecture` · `workspace-based environments` · `remote state backends` · `scalable IaC`

<br/>

[![Terraform](https://img.shields.io/badge/Terraform-1.x-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-22C55E?style=for-the-badge)](./LICENSE)
[![Status](https://img.shields.io/badge/Status-Active-22C55E?style=for-the-badge)]()

</div>

---

## 🗺️ What This Repository Is

This isn't just a tutorial follow-along — it's a structured learning journey from **zero Terraform knowledge** to **production-grade multi-environment infrastructure** on AWS.

Every folder in this repo represents a real concept I studied, broke, fixed, and understood.

> **End goal:** Build the kind of infrastructure setup used by real engineering teams — modular, environment-aware, and state-managed.

---

## 📂 Repository Structure
```
.
├── 🌟 terraform-aws-multi-environment-project/   ← MAIN PROJECT (start here)
│   ├── main.tf
│   ├── variables.tf
│   ├── provider.tf
│   ├── terraform.tf
│   └── modules/
│       ├── ec2/
│       ├── s3/
│       └── dynamodb/
│
├── terraform-advance-practise/                   ← Import, locals, conditionals
├── remote-backends/                              ← S3 + DynamoDB backend config
├── ec2.tf                                        ← Root-level EC2 basics
├── s3.tf                                         ← Root-level S3 basics
└── terra-automate-key.pub                        ← SSH public key
```

---

## ⭐ Main Project: Multi-Environment Infrastructure

> `terraform-aws-multi-environment-project/`

This is the **centrepiece of the repo** — a production-inspired setup that provisions different infrastructure tiers across Dev, Staging, and Production using a **single codebase**.

### Architecture Overview

![Architecture](./assets/architecture.png)

Infrastructure scales dynamically based on the active Terraform workspace:

| Environment | EC2 Instances | S3 Buckets | DynamoDB Tables |
|:-----------:|:-------------:|:----------:|:---------------:|
| `dev`       | 2             | 1          | 1               |
| `stg`       | 3             | 1          | 1               |
| `prd`       | 4             | 2          | 2               |

### How Environment-Switching Works

A single `locals` block drives all environment-specific config:
```hcl
locals {
  env = {
    dev = { instance_count = 2 }
    stg = { instance_count = 3 }
    prd = { instance_count = 4 }
  }
  current = lookup(local.env, terraform.workspace, local.env["dev"])
}
```

One codebase. Three environments. Zero duplication. ✅

---

## 🧱 Module Breakdown

### `modules/ec2`
- Provisions EC2 instances with workspace-controlled count
- Configures security groups, key pairs, and root volumes
- Outputs public IP and DNS for downstream use

### `modules/s3`
- Creates environment-namespaced S3 buckets
- Consistent naming convention across workspaces

### `modules/dynamodb`
- Provisions DynamoDB tables per environment
- Also used for Terraform remote state locking

---

## 🔧 Remote Backend — `remote-backends/`

Terraform state is stored remotely, preventing conflicts in team environments:
```hcl
backend "s3" {
  bucket         = "my-terraform-backend-bucket-dhurandaar"
  dynamodb_table = "my-terraform-backend-table"
  key            = "terraform.tfstate"
  region         = "ap-south-1"
}
```

| Component   | Role                                        |
|-------------|---------------------------------------------|
| S3 Bucket   | Stores `.tfstate` file                      |
| DynamoDB    | State locking (prevents race conditions)    |

---

## 🧪 Advanced Practice — `terraform-advance-practise/`

Experiments that pushed beyond the basics:

- **`terraform import`** — Bringing existing AWS resources under Terraform management
- **`aws_ec2_instance_state`** — Managing instance lifecycle declaratively
- **Conditional logic** — Environment-aware resource decisions
- **Local variables** — Reducing repetition across configs

---

## 🚀 Running the Project
```bash
# 1. Initialize Terraform
terraform init

# 2. Create workspaces
terraform workspace new dev
terraform workspace new stg
terraform workspace new prd

# 3. Switch to target environment
terraform workspace select dev

# 4. Preview changes
terraform plan

# 5. Apply infrastructure
terraform apply
```

---

## 🧠 Concepts Covered

<details>
<summary><strong>Fundamentals</strong></summary>

- Resource creation: EC2, S3, DynamoDB
- Provider configuration
- `variables.tf` and `output.tf`
- State file basics

</details>

<details>
<summary><strong>Intermediate</strong></summary>

- `locals` and `lookup()` for dynamic config
- `count` for scalable resource creation
- Conditional expressions
- Workspace-based deployments

</details>

<details>
<summary><strong>Advanced</strong></summary>

- Modular Terraform architecture
- Remote backends (S3 + DynamoDB)
- Importing existing infrastructure
- Multi-environment design patterns

</details>

---

## 🔐 Security Note

> ⚠️ Private keys must **never** be committed to version control.

Add the following to your `.gitignore`:
```
*.pem
terra-automate-key
```

---

## 🛣️ Roadmap

- [ ] Custom VPC module (replace default VPC)
- [ ] IAM roles attached to EC2 instances
- [ ] CI/CD pipeline with GitHub Actions
- [ ] Application deployment via `user_data`
- [ ] CloudWatch monitoring & alerting
- [ ] Cost estimation with Infracost

---

## 👤 Author

**Aniruddha Kharve**
Aspiring Cloud & DevOps Engineer

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat-square&logo=linkedin)](https://linkedin.com/in/YOUR_HANDLE)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=flat-square&logo=github)](https://github.com/YOUR_HANDLE)

---

<div align="center">

**If this project helped you, drop a ⭐ — it means a lot.**

*Built with curiosity, broken with confidence, fixed with Google.* 🔧

</div>
