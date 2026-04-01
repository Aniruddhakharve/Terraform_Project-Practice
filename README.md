# 🚀 Terraform AWS Multi-Environment Infrastructure Project

## 📌 Overview

This project demonstrates a **real-world DevOps infrastructure setup** using **Terraform on AWS**, implementing:

- Multi-environment infrastructure (Dev, Staging, Production)
- Modular Terraform architecture
- Remote backend with state locking
- Infrastructure automation using reusable modules

---

## 🧠 Architecture Overview

![Architecture](./assets/architecture.png)

> 📌 This architecture represents a multi-environment setup where infrastructure is dynamically provisioned using Terraform modules and workspaces.

### 🔥 Key Concepts Used:
- Terraform Modules
- Terraform Workspaces
- Remote Backend (S3 + DynamoDB)
- Environment-based Infrastructure Scaling

---

## 🏗️ Project Architecture Explanation

- **Dev Environment**
  - Minimal infrastructure (2 EC2 instances, 1 S3 bucket, 1 DynamoDB table)
  
- **Staging Environment**
  - Medium-scale infrastructure (3 EC2 instances, 1 S3 bucket, 1 DynamoDB table)

- **Production Environment**
  - High-scale infrastructure (4 EC2 instances, multiple S3 buckets & DynamoDB tables)

👉 All environments are managed using:
terraform workspace

---

## 📂 Project Structure

.
├── terraform-aws-multi-environment-project/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── terraform.tf
│   │
│   ├── modules/
│   │   ├── ec2/
│   │   ├── s3/
│   │   └── Dynamodb/
│   │
│   ├── terra-automate-key.pub
│   └── terra-automate-key (⚠️ DO NOT COMMIT)
│
├── terraform-advance-practise/
│   ├── ec2.tf
│   ├── variables.tf
│   ├── output.tf
│   ├── imports.tf
│   └── providers.tf
│
├── remote-backends/
│   ├── remote-backends.tf
│   ├── providers.tf
│   └── terraform.tf
│
├── ec2.tf
├── s3.tf
└── terra-automate-key.pub

---

## 📁 Folder Breakdown

### 🔹 terraform-aws-multi-environment-project/

This is the **main production-style Terraform project**.

#### 📄 main.tf
- Uses Terraform modules
- Dynamically provisions infrastructure using terraform.workspace

#### 📄 variables.tf
- Contains reusable variables

#### 📄 provider.tf
- AWS provider configuration

#### 📄 terraform.tf
- Required providers configuration

---

### 📦 modules/

Reusable infrastructure components:

#### 🔸 modules/ec2/
- Provisions EC2 instances
- Configurable instance count per environment
- Security group, key pair, root volume
- Outputs public IP and DNS

#### 🔸 modules/s3/
- Creates S3 buckets
- Dynamic naming using environment

#### 🔸 modules/Dynamodb/
- Creates DynamoDB tables
- Used for backend locking and scalable storage

---

### 🔹 remote-backends/

Implements Terraform remote backend:

- S3 bucket → stores Terraform state
- DynamoDB → manages state locking

backend "s3" {
  bucket         = "my-terraform-backend-bucket-dhurandaar"
  dynamodb_table = "my-terraform-backend-table"
  key            = "terraform.tfstate"
  region         = "ap-south-1"
}

---

### 🔹 terraform-advance-practise/

Advanced Terraform concepts:

- Import existing AWS resources
- Manage EC2 instance state
- Use of locals and conditional logic

---

### 🔹 Root Level Files

#### ec2.tf
- Basic EC2 provisioning for practice

#### s3.tf
- Simple S3 bucket creation

---

## ⚙️ How It Works

### 1️⃣ Initialize Terraform
terraform init

### 2️⃣ Create Workspaces
terraform workspace new dev
terraform workspace new stg
terraform workspace new prd

### 3️⃣ Select Workspace
terraform workspace select dev

### 4️⃣ Apply Infrastructure
terraform apply

---

## 🔁 Environment-Based Scaling

locals {
  env = {
    dev = {
      instance_count = 2
      bucket_count   = 1
      table_count    = 1
    }

    stg = {
      instance_count = 3
      bucket_count   = 1
      table_count    = 1
    }

    prd = {
      instance_count = 4
      bucket_count   = 2
      table_count    = 2
    }
  }

  current = lookup(local.env, terraform.workspace, local.env["dev"])
}

👉 Infrastructure automatically scales based on selected workspace

---

## 🔐 Security Note

⚠️ DO NOT commit private key to GitHub

Add this to .gitignore:
*.pem
terra-automate-key

---

## 🚀 Key Features

- Multi-environment infrastructure (Dev, Staging, Prod)
- Modular Terraform architecture
- Remote backend with S3 + DynamoDB
- Environment-based scaling
- Reusable infrastructure components
- Clean and organized project structure

---

## 📈 Future Improvements

- Add custom VPC module (instead of default VPC)
- Implement IAM roles for EC2
- Add CI/CD pipeline (GitHub Actions / Jenkins)
- Deploy applications using user_data
- Add monitoring using CloudWatch

---

## 🧑‍💻 Author

Aniruddha Kharve  
Aspiring Cloud & DevOps Engineer 🚀

---

## ⭐ Support

If you like this project, give it a ⭐ on GitHub and feel free to fork!
