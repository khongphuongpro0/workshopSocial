---
title: "Workshop: Triển khai Ứng dụng Web Social Media trên AWS"
date: 2025-12-09T10:00:00+07:00
weight: 5
chapter: true
pre: "<b>5.</b> "
---

# 🛠️ Workshop: Triển khai Ứng dụng Web Social Media trên AWS

Workshop này cung cấp hướng dẫn chi tiết từng bước để triển khai một ứng dụng web Social Media (bao gồm Frontend và Backend) lên nền tảng **Amazon Web Services (AWS)**. Chúng ta sẽ xây dựng một kiến trúc hiện đại, bảo mật, và có khả năng mở rộng bằng cách sử dụng các dịch vụ Cloud như VPC, S3, CloudFront, RDS, ECR, ALB, và ECS Fargate.

## Mục tiêu chính

- Thiết lập một môi trường mạng (VPC) bảo mật và sẵn sàng cao.
- Triển khai Frontend tĩnh trên S3/CloudFront (sử dụng HTTPS và Route 53).
- Đóng gói và triển khai Backend dưới dạng container trên ECS Fargate.
- Sử dụng RDS cho tầng dữ liệu (Database).

## Các bước trong Workshop

### 5.1. Tổng quan Workshop

Tổng quan về mục tiêu, kiến trúc và các kết quả mong đợi của Workshop.

### 5.2. Các Yêu cầu Tiên quyết

Chuẩn bị các tài khoản AWS, công cụ (AWS CLI, Docker) và mã nguồn cần thiết trước khi bắt đầu.

### 5.3. Thiết lập S3, CloudFront và VPC

- **5.3.1. Tạo S3 cho Upload và Frontend:** Tạo các bucket S3 cho file upload và hosting Frontend, cấu hình IAM cho việc upload.
- **5.3.2. Cấu hình CDN và Route 53:** Thiết lập CloudFront (CDN) để phục vụ Frontend qua HTTPS và cấu hình tên miền qua Route 53 và ACM.
- **5.3.3. Thiết lập Mạng VPC:** Tạo VPC, Internet Gateway, và các Subnet (Public/Private) cần thiết.

### 5.4. Cấu hình Mạng Nâng cao

- **Tạo NAT Gateway và Route Table:** Thiết lập NAT Gateway để Private Subnet có thể truy cập Internet (ra ngoài) và cấu hình các Route Table tương ứng cho các loại Subnet.

### 5.5. Thiết lập Database RDS

- **Tạo DB Subnet Group và RDS:** Khởi tạo DB Subnet Group và Database MySQL/RDS trong Private Subnet.

### 5.6. Triển khai Container và Load Balancing (Cleanup)

- **Docker, ECR và Push Image:** Đóng gói Backend bằng Docker và đẩy image lên ECR.
- **Security Group và ALB:** Tạo Security Group và thiết lập Application Load Balancer (ALB) để điều hướng traffic an toàn đến Backend.
- **ECS Cluster và Service:** Cấu hình Task Definition, tạo ECS Cluster (Fargate) và ECS Service để triển khai Backend.
- **Kết thúc:** Cấu hình Route 53 cuối cùng để trỏ tên miền API về ALB và kiểm tra kết quả.
