---
title: "Workshop: Deploying a Social Media Web Application on AWS"
date: 2025-12-09T10:00:00+07:00
weight: 5
chapter: true
pre: "<b>5.</b> "
---

# 🛠️ Workshop: Deploying a Social Media Web Application on AWS

This Workshop provides detailed, step-by-step guidance for deploying a Social Media web application (including both Frontend and Backend) onto the **Amazon Web Services (AWS)** platform. We will build a modern, secure, and scalable architecture using Cloud services such as VPC, S3, CloudFront, RDS, ECR, ALB, and ECS Fargate.

[Image of Three-Tier Web Application Architecture on AWS]

## Main Objectives

- Establish a secure and highly available network environment (VPC).
- Deploy the static Frontend on S3/CloudFront (using HTTPS and Route 53).
- Package and deploy the Backend as a container on ECS Fargate.
- Utilize RDS for the data tier (Database).

---

## Workshop Steps

### 5.1. Workshop Overview

An overview of the objectives, architecture, and expected outcomes of the Workshop.

### 5.2. Prerequisites

Preparation of necessary AWS accounts, tools (AWS CLI, Docker), and required source code before starting.

### 5.3. S3, CloudFront, and VPC Setup

- **5.3.1. Create S3 for Upload and Frontend:** Create S3 buckets for file uploads and Frontend hosting, and configure IAM for uploading.
- **5.3.2. Configure CDN and Route 53:** Set up CloudFront (CDN) to serve the Frontend over HTTPS and configure the domain via Route 53 and ACM.
- **5.3.3. Set up VPC Network:** Create the VPC, Internet Gateway, and necessary Subnets (Public/Private).

### 5.4. Advanced Network Configuration

- **Create NAT Gateway and Route Table:** Set up the NAT Gateway for Private Subnets to access the Internet (outbound) and configure corresponding Route Tables for different Subnet types.

### 5.5. RDS Database Setup

- **Create DB Subnet Group and RDS:** Initialize the DB Subnet Group and the MySQL/RDS Database within a Private Subnet.

### 5.6. Container Deployment and Load Balancing (Cleanup)

- **Docker, ECR, and Push Image:** Package the Backend with Docker and push the image to ECR.
- **Security Group and ALB:** Create Security Groups and set up the Application Load Balancer (ALB) to securely route traffic to the Backend.
- **ECS Cluster and Service:** Configure the Task Definition, create the ECS Cluster (Fargate), and the ECS Service to deploy the Backend.
- **Conclusion:** Final Route 53 configuration to point the API domain to the ALB and verify the results.
