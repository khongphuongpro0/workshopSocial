---
title: "Worklog Tuần 12"
date: "2024-01-15"
weight: 2
chapter: false
pre: " <b> 1.12 </b> "
---

### Mục tiêu tuần 12:

- **Hoàn thiện Frontend:** Xây dựng và tích hợp các tính năng backend đã hoàn thành vào giao diện **ReactJS**.
- **Triển khai Cloud (AWS):** Áp dụng các dịch vụ AWS để triển khai ứng dụng, đảm bảo khả năng mở rộng và hiệu suất:
  - Triển khai **Frontend** lên AWS (S3, CloudFront/Route 53).
  - Triển khai **Backend** sử dụng container (Docker, ECR, ECS).
  - Thiết lập **Database** quản lý (RDS).

---

### Các công việc cần triển khai trong tuần này:

| Thứ   | Công việc                                                                                                                                                                                                                                                                                                 | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu |
| ----- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | -------------- |
| 2 - 3 | **Tích hợp Frontend (ReactJS):** <br> - Kết nối các API (Service/Controller) đã hoàn thiện (ví dụ: đăng nhập, đăng ký, lấy thông tin cá nhân, lấy bài post) vào các trang **ReactJS** đã dựng khung. <br> - Xây dựng giao diện **Home/Feed** hoàn chỉnh, hiển thị bài post và chức năng **Like/Comment**. | 17/11/2025   | 18/11/2025      |
| 4     | **Triển khai Database (AWS RDS):** <br> - Thiết lập dịch vụ **AWS RDS** (ví dụ: PostgreSQL/MySQL) và cấu hình để thay thế cơ sở dữ liệu cục bộ. <br> - Cập nhật chuỗi kết nối (Connection String) trong Backend để trỏ về **RDS**.                                                                        | 19/11/2025   | 19/11/2025      |
| 5     | **Containerization (Docker & ECR):** <br> - Tạo **Dockerfile** cho ứng dụng Backend. <br> - Xây dựng **Docker Image** và đẩy (Push) lên **AWS ECR** (Elastic Container Registry) để chuẩn bị cho việc triển khai.                                                                                         | 20/11/2025   | 20/11/2025      |
| 6     | **Triển khai Backend (AWS ECS):** <br> - Cấu hình và triển khai dịch vụ **AWS ECS** (Elastic Container Service) để chạy Docker Image Backend từ ECR. <br> - Thiết lập **Load Balancer** và **Security Group** cho ECS.                                                                                    | 21/11/2025   | 21/11/2025      |
| 7     | **Triển khai Frontend (S3, CloudFront & Route 53):** <br> - Build ứng dụng ReactJS và đẩy lên **AWS S3** (Web Hosting). <br> - Thiết lập **AWS CloudFront** (CDN) để phân phối nội dung tĩnh và tăng tốc độ truy cập. <br> - Cấu hình **AWS Route 53** để trỏ tên miền về CloudFront.                     | 22/11/2025   | 23/11/2025      |

---

### Kết quả đạt được tuần 12:

- **Frontend hoàn chỉnh:** Tích hợp thành công các tính năng **CRUD** cơ bản và tính năng tương tác (Like, Comment, Chat) vào giao diện **ReactJS/Boostrap**.
- **Backend Containerized:** Ứng dụng Backend được đóng gói bằng **Docker** và sẵn sàng triển khai trên môi trường container.
- **Triển khai trên AWS:**
  - Database đã chuyển sang **AWS RDS**.
  - Backend đã được triển khai lên **AWS ECS**.
  - Frontend đã được triển khai lên **AWS S3/CloudFront** và cấu hình **Route 53**.
