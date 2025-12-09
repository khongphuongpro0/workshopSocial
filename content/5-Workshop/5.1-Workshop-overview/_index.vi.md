---
title: "Tổng quan Workshop"
date: 2025-12-10T11:00:00+07:00
weight: 1
chapter: true
pre: "<b>5.1.</b> "
---

# 🚀 Tổng quan về Workshop: Triển khai Ứng dụng Web trên AWS

Workshop này được thiết kế để hướng dẫn bạn từng bước xây dựng và triển khai một ứng dụng web hoàn chỉnh (bao gồm Frontend và Backend) lên nền tảng **Amazon Web Services (AWS)**, sử dụng các dịch vụ Cloud hiện đại và kiến trúc tối ưu.

## 1.1. Mục tiêu Workshop

Sau khi hoàn thành Workshop, bạn sẽ nắm vững các kỹ năng sau:

- **Thiết lập Mạng:** Tạo và cấu hình **VPC (Virtual Private Cloud)**, Subnet (Public/Private), Internet Gateway, và NAT Gateway để đảm bảo môi trường mạng bảo mật và sẵn sàng cao.
- **Lưu trữ Dữ liệu:** Khởi tạo và quản lý **Amazon RDS (Relational Database Service)** cho Database Backend.
- **Lưu trữ Tĩnh:** Sử dụng **Amazon S3** để lưu trữ nội dung tĩnh (Frontend) và các tệp upload của người dùng.
- **Phân phối Nội dung và Tên miền:** Cấu hình **Amazon CloudFront (CDN)** để tăng tốc độ và bảo mật, kết hợp với **Amazon Route 53** để quản lý tên miền và **ACM (AWS Certificate Manager)** cho chứng chỉ SSL.
- **Container hóa và Triển khai:** Đóng gói ứng dụng Backend bằng **Docker**, đẩy image lên **ECR (Elastic Container Registry)**.
- **Load Balancing và Bảo mật:** Thiết lập **Application Load Balancer (ALB)** và cấu hình **Security Group** chi tiết để kiểm soát lưu lượng truy cập.
- **Triển khai Serverless/Container:** Triển khai ứng dụng Backend lên **Amazon ECS (Elastic Container Service)** sử dụng **Fargate** để vận hành linh hoạt và hiệu quả.

---

## 1.2. Kiến trúc Ứng dụng

Ứng dụng mẫu sẽ được triển khai theo **kiến trúc ba tầng (Three-Tier Architecture)**, đảm bảo tính sẵn sàng cao, khả năng mở rộng và bảo mật:

- **Tầng Web (Frontend):** Ứng dụng ReactJS được lưu trữ trên **Amazon S3** và phân phối qua **CloudFront** (sử dụng tên miền riêng thông qua Route 53 và HTTPS).
- **Tầng Ứng dụng (Backend):** Ứng dụng Backend được đóng gói bằng **Docker**, lưu trữ trên **ECR**, và chạy trên **ECS Fargate**, được truy cập thông qua **ALB** trong các Private Subnet.
- **Tầng Dữ liệu:** Database **MySQL** được quản lý bởi **Amazon RDS**, nằm hoàn toàn trong Private Subnet và chỉ giao tiếp với Backend.

Bạn đã sẵn sàng để bắt đầu hành trình triển khai của mình chưa?

---
