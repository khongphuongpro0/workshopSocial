---
title: "Proposal"
date: "2024-01-15"
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

# Social Media Platform

## Integrated AWS Cloud Solution for Real-time Social Network

### 1. Executive Summary

The Social Media Platform is designed to provide a comprehensive social communication solution. The platform supports up to 100 concurrent users, scalable to 500 users, using a .NET 8 backend combined with SignalR WebSocket for real-time communication. The platform leverages AWS Cloud services to deliver real-time chat, full social media features (post, comment, reaction, share, story, group, fanpage), and high security with JWT authentication.

### 2. Problem Statement

_Current Problem_
Existing social media platforms like Facebook and Instagram are overly complex with many unnecessary features, have privacy issues, and high costs. There is no dedicated platform for small communities with customization capabilities and full data ownership.

_Solution_
The platform uses Amazon ECS with Fargate to run .NET 8 backend containers, Application Load Balancer to distribute traffic (supports WebSocket), Amazon RDS SQL Server for data storage (with AWS DMS for migration), Amazon S3 combined with CloudFront CDN to host and distribute the React frontend and media files. VPC with Subnets and Security Groups ensures network security. SignalR WebSocket provides real-time chat, JWT ensures authentication/authorization, and SendGrid sends confirmation emails. CloudWatch monitors the system. Similar to Facebook and Instagram, users can post, real-time chat (1-1 and group), comment, react, share, create stories (auto-delete after 24h), manage groups and fanpages, add friends, follow and block users. Key features include full chat (history, stickers, reactions, edit/delete messages), comprehensive social features, and optimized operating costs.

_Benefits and Return on Investment (ROI)_
The solution creates a private social media platform with full data control and high customization, while providing data sources for AI/ML research (sentiment analysis, recommendation systems). The platform replaces expensive enterprise solutions through self-managed systems, simplifies internal communication, and improves engagement. Estimated monthly cost is $90-120 USD for 100 users (self-estimated, not using AWS calculation tools), totaling $1,080-1,440 USD for 12 months. Payback period of 3-6 months through license cost savings and monetization capabilities.

### 3. Solution Architecture

The platform applies Client-Server architecture with AWS Cloud Infrastructure to manage 100 concurrent users, scalable to 500. React frontend is hosted on S3 and distributed via CloudFront CDN. Traffic goes through Application Load Balancer (supports HTTP/HTTPS and WebSocket) to ECS Fargate containers running .NET 8 backend with SignalR. Primary database is RDS SQL Server (Single-AZ for cost savings), media files stored in S3 (distributed via CloudFront). VPC with Public/Private Subnets and Security Groups ensures network isolation. AWS DMS migrates database to cloud, CloudWatch monitors.

![AWS Infrastructure Architecture](./images/aws-social-media.png)

_AWS Services Used_

- _Amazon ECS + Fargate_: Run .NET 8 backend containers, auto-scaling
- _Amazon ECR_: Store Docker images
- _Application Load Balancer_: Distribute traffic, support WebSocket for SignalR
- _Amazon RDS (SQL Server)_: Primary database, Single-AZ deployment
- _AWS DMS_: Migrate database from on-premise to RDS
- _Amazon S3_: Store frontend (bucket 1) and media files (bucket 2)
- _Amazon CloudFront_: CDN for frontend and media distribution
- _Amazon VPC_: Network isolation with public/private subnets
- _Security Groups_: Firewall rules for ALB, ECS, RDS
- _AWS Route 53_: DNS management (optional)
- _Amazon CloudWatch_: Logs, metrics, alarms

_Component Design_

- _Frontend_: React app hosted on S3, distributed via CloudFront, accesses backend via HTTPS/WebSocket
- _Load Balancer_: ALB routes traffic to ECS tasks, sticky sessions for SignalR
- _Backend Services_: ECS Fargate runs 4 tasks (2 REST API + 2 SignalR Hub)
- _Database_: RDS SQL Server stores users, posts, messages, stories, groups, pages, relationships
- _Storage_: S3 stores avatars, post media, story media; CloudFront cache and distribution
- _Authentication_: JWT tokens, SendGrid sends verification emails
- _Monitoring_: CloudWatch collects logs and metrics from ECS, ALB, RDS

### 4. Technical Implementation

_Implementation Phases_
The project consists of 2 parts — backend/frontend development and AWS infrastructure deployment — across 4 phases:

1. _Planning and Architecture Design_: Research .NET 8, SignalR, React, AWS services and design database schema, system architecture (Month 1, Week 1-2)
2. _Core Features Development and Continuing AWS Architecture Research_: Code authentication, user management, post system, story feature (Month 1 Week 3 - Month 2)
3. _Real-time Features Development_: Implement SignalR chat (1-1 and group), notifications (Month 2-3)
4. _Optimization, Deployment_: Container packaging, AWS deployment with CDK/CloudFormation (Month 3)

_Technical Requirements_

- _Backend_: .NET 8 with SignalR (WebSocket), Entity Framework Core, JWT authentication. Package application with Docker, push images to ECR, deploy to ECS Fargate with 4 tasks (2 API + 2 SignalR).
- _Frontend_: React with SignalR Client, Tailwind CSS. Build static files deploy to S3, distribute through CloudFront service.
- _Database_: SQL Server with schema: Users, Posts, Comments, Reactions, Messages, Conversations, GroupChats, Stories, Groups, Pages, Friendships, Follows. Optimize by adding Indexes for related tables. Use AWS DMS to migrate from local to RDS.
- _Infrastructure_: Use AWS CDK/CloudFormation to configure VPC, Subnets, Security Groups, ALB, ECS Cluster, RDS, S3, CloudFront. Build CI/CD pipeline with GitHub Actions: build → test → push to ECR → update ECS service → deploy frontend to S3.

### 5. Roadmap & Implementation Milestones

- _Pre-internship (Month 0)_: Self-learn .NET, basic React research
- _Internship (Month 1–3)_:
  - Month 1:
    - Week 1-2: Architecture design, database design, AWS setup
    - Week 3-4: User authentication, user APIs
  - Month 2:
    - Week 5-6: Post system
    - Week 7-8: Groups, Pages
    - Week 9-10: 1-1 Chat with SignalR
  - Month 3:
    - Week 11: Group chat, Notifications
    - Week 12: Testing, container packaging, AWS deployment, production launch
- _Post-deployment_: Monitoring, maintenance, feature upgrades over 6-12 months

### 6. Budget Estimation

_AWS Infrastructure Costs_ (for 100 users)

- Amazon ECS Fargate: ~80 USD/month (4 tasks: 2 API + 2 SignalR, equivalent to t3.small per task)
- Application Load Balancer: ~20 USD/month
- Amazon RDS SQL Server: ~30 USD/month (db.t3.micro, 20GB, Single-AZ)
- Amazon S3: ~2 USD/month (store 50GB)
- CloudFront: ~5 USD/month (transfer 100GB data)
- Data Transfer: ~10 USD/month (outbound data)
- Amazon ECR: ~1 USD/month
- CloudWatch: ~5 USD/month (more logs due to 4 tasks)
- AWS Secrets Manager: ~1 USD/month
- Route 53: ~1 USD/month (optional)

_Total_: ~155 USD/month, 1,860 USD/12 months

_Optimized with AWS Free Tier_: ~90-120 USD/month, 1,080-1,440 USD/12 months

_Development Costs_

- Software: 0 USD (Visual Studio Community, VS Code, Git - free)
- Domain: ~12 USD/year
- SendGrid: 0 USD (free tier: 100 emails/day)

_Total_: ~12 USD/year for domain

### 7. Risk Assessment

_Risk Matrix_

- High user load: Medium impact, low probability
- Database failure: High impact, low probability
- Security breach: High impact, medium probability
- Budget overrun: Low impact, low probability

_Mitigation Strategies_

- User load: Auto-scale ECS when needed, ALB load balancing, optimize database indexes
- Database: Automatic daily backups, point-in-time recovery, can upgrade to Multi-AZ if needed
- Security: AWS WAF, JWT authentication, input sanitization, HTTPS/WSS encryption, Security Groups
- Costs: CloudWatch billing alerts ($100/month threshold), turn off unused resources

_Contingency Plan_

- Restore from RDS snapshot if database fails
- Scale down instances if budget exceeded
- Use CloudFormation rollback if deployment issues

### 8. Expected Outcomes

_Technical Improvements_: Real-time chat with response time < 100ms. API response time < 300ms. Support 100 concurrent users, scalable to 500. Uptime 99%.

_Long-term Value_: 6+ months data platform for AI/ML research (sentiment analysis, recommendation systems). Full-stack development experience with modern technologies. AWS cloud expertise and DevOps practices. Reusable/extendable for future projects (video call, live streaming, e-commerce).
