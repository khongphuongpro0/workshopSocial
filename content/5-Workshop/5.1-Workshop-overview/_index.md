---
title: "Workshop Overview"
date: 2025-12-10T11:00:00+07:00
weight: 1
chapter: true
pre: "<b>5.1.</b> "
---

# 🚀 Workshop Overview: Deploying a Web Application on AWS

This workshop is designed to guide you step-by-step through building and deploying a complete web application (including Frontend and Backend) onto the **Amazon Web Services (AWS)** platform, utilizing modern Cloud services and optimized architecture.

## 1.1. Workshop Objectives

Upon completing this Workshop, you will gain proficiency in the following skills:

- **Networking Setup:** Create and configure **VPC (Virtual Private Cloud)**, Subnets (Public/Private), Internet Gateway, and NAT Gateway to ensure a secure and highly available network environment.
- **Data Storage:** Initialize and manage **Amazon RDS (Relational Database Service)** for the Backend Database.
- **Static Storage:** Use **Amazon S3** to host static content (Frontend) and user-uploaded files.
- **Content Delivery and Domain:** Configure **Amazon CloudFront (CDN)** for acceleration and security, combined with **Amazon Route 53** for domain management and **ACM (AWS Certificate Manager)** for SSL certificates.
- **Containerization and Deployment:** Package the Backend application using **Docker**, and push the image to **ECR (Elastic Container Registry)**.
- **Load Balancing and Security:** Set up an **Application Load Balancer (ALB)** and configure detailed **Security Groups** to control traffic flow.
- **Serverless/Container Deployment:** Deploy the Backend application to **Amazon ECS (Elastic Container Service)** using **Fargate** for flexible and efficient operation.

---

## 1.2. Application Architecture

The sample application will be deployed following a **Three-Tier Architecture**, ensuring high availability, scalability, and security:

[Image of Three-Tier Web Application Architecture on AWS]

- **Web Tier (Frontend):** The ReactJS application is hosted on **Amazon S3** and distributed via **CloudFront** (using a custom domain through Route 53 and HTTPS).
- **Application Tier (Backend):** The Backend application is packaged with **Docker**, stored on **ECR**, and run on **ECS Fargate**, accessed via an **ALB** within Private Subnets.
- **Data Tier:** The **MySQL** Database, managed by **Amazon RDS**, resides entirely within a Private Subnet and only communicates with the Backend.

Are you ready to begin your deployment journey?

---
