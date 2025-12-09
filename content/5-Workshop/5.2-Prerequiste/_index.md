---
title: "Prerequisites"
date: 2025-12-10T11:05:00+07:00
weight: 2
chapter: true
pre: "<b>5.2.</b> "
---

# ⚙️ Preparation: Essential Tools and Accounts

Before starting the Workshop, you need to ensure you have all the necessary accounts, tools, and source code ready.

## 2.1. AWS Account Requirements

- **Active AWS Account:** You must have an AWS account that has been created and activated.
- **IAM Permissions:** Ensure your account or IAM User has full permissions to create and manage the following services: **VPC, S3, Route 53, ACM, RDS, ECR, ECS, EC2 (for ALB/Target Group)**.
- **Free Tier Consideration:** If you are using a **Free Tier** account, select the smallest configurations (e.g., `t4g.micro` for RDS) to avoid incurring costs. This Workshop prioritizes services where the Free Tier is applicable, such as **ECR, ECS Fargate** (with limits), and **S3** (with limits).

---

## 2.2. Tool and Software Requirements

You need to install the following tools on your personal computer to perform the steps in the Workshop:

- **AWS CLI (Command Line Interface):** Essential for interacting with AWS, particularly for pushing images to ECR and configuring IAM Access Key/Secret Key.
  - Use the command `aws configure` to set up your access information.
- **Docker:** Required to build (package) the Backend application into a Docker Image.
- **Application Source Code:**
  - **Frontend:** Frontend application source code ( ReactJS) that has been **built** into static files (e.g., a `build` or `dist` folder).
  - **Backend:** Backend application source code (.NEt) along with a pre-prepared **Dockerfile**.
- **Database Tool:** **MySQL Workbench** or **DBeaver** (or any other Client tool) to test the connection and perform the initial database migration.

---
