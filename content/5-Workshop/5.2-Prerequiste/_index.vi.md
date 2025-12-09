---
title: "Các Yêu cầu Tiên quyết"
date: 2025-12-10T11:05:00+07:00
weight: 2
chapter: true
pre: "<b>5.2.</b> "
---

# ⚙️ Chuẩn bị: Công cụ và Tài khoản cần thiết

Trước khi bắt đầu Workshop, bạn cần đảm bảo đã chuẩn bị đầy đủ các yêu cầu về tài khoản, công cụ và mã nguồn.

## 2.1. Yêu cầu về Tài khoản AWS

- **Tài khoản AWS hoạt động:** Bạn cần có một tài khoản AWS đã được tạo và kích hoạt.
- **Quyền truy cập IAM:** Đảm bảo tài khoản hoặc IAM User của bạn có đầy đủ quyền để tạo và quản lý các dịch vụ sau: **VPC, S3, Route 53, ACM, RDS, ECR, ECS, EC2 (cho ALB/Target Group)**.
- **Free Tier:** Nếu bạn sử dụng tài khoản **Free Tier**, hãy chọn các cấu hình nhỏ nhất (ví dụ: `t4g.micro` cho RDS) để tránh phát sinh chi phí. Workshop này ưu tiên sử dụng các dịch vụ có thể áp dụng Free Tier như **ECR, ECS Fargate** (với giới hạn), và **S3** (với giới hạn).

---

## 2.2. Yêu cầu về Công cụ và Phần mềm

Bạn cần cài đặt các công cụ sau trên máy tính cá nhân để thực hiện các bước trong Workshop:

- **AWS CLI (Command Line Interface):** Cần thiết để tương tác với AWS, đặc biệt là các thao tác đẩy image lên ECR và cấu hình tài khoản IAM Access Key/Secret Key.
  - Sử dụng lệnh `aws configure` để thiết lập thông tin truy cập.
- **Docker:** Cần thiết để build (đóng gói) ứng dụng Backend thành Docker Image.
- **Mã nguồn Ứng dụng:**
  - **Frontend:** Mã nguồn ứng dụng Frontend (ReactJS) đã được `build` ra các tệp tĩnh (ví dụ: folder `build` hoặc `dist`).
  - **Backend:** Mã nguồn ứng dụng Backend (.Net) cùng với **Dockerfile** đã được chuẩn bị sẵn.
- **Công cụ Database:** **MySQL Workbench** hoặc **DBeaver** (hoặc bất kỳ công cụ Client nào khác) để kiểm tra kết nối và migration database ban đầu.

---
