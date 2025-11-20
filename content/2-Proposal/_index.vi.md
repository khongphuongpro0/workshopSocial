---
title: "Bản đề xuất"
date: "2024-01-15"
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

# Nền tảng Mạng Xã Hội (Social Media Platform)

## Giải pháp AWS Cloud Tích hợp cho Mạng Xã hội Thời gian thực

### 1. Tóm tắt điều hành

Nền tảng Mạng Xã hội được thiết kế nhằm cung cấp một giải pháp truyền thông xã hội toàn diện. Nền tảng hỗ trợ tối đa 100 người dùng đồng thời, có khả năng mở rộng lên 500 người dùng, sử dụng backend .NET 8 kết hợp SignalR WebSocket để truyền thông thời gian thực. Nền tảng tận dụng các dịch vụ AWS Cloud để cung cấp chat thời gian thực, tính năng mạng xã hội đầy đủ (post, comment, reaction, share, story, group, fanpage), và bảo mật cao với JWT authentication.

### 2. Tuyên bố vấn đề

_Vấn đề hiện tại_  
Các nền tảng mạng xã hội hiện tại như Facebook, Instagram quá phức tạp với nhiều tính năng không cần thiết, có vấn đề về quyền riêng tư và chi phí cao. Không có nền tảng chuyên dụng cho cộng đồng nhỏ với khả năng tùy chỉnh và toàn quyền sở hữu dữ liệu.

_Giải pháp_  
Nền tảng sử dụng Amazon ECS với Fargate để chạy .NET 8 backend containers, Application Load Balancer để phân phối traffic (hỗ trợ WebSocket), Amazon RDS SQL Server để lưu trữ dữ liệu (với AWS DMS để migration), Amazon S3 kết hợp CloudFront CDN để lưu trữ và phân phối frontend React cũng như media files. VPC với Subnets và Security Groups đảm bảo bảo mật mạng. SignalR WebSocket cung cấp chat thời gian thực, JWT đảm bảo authentication/authorization, và SendGrid gửi email xác nhận. CloudWatch monitoring hệ thống. Tương tự Facebook và Instagram, người dùng có thể đăng bài, chat realtime (1-1 và nhóm), comment, reaction, share, tạo story (tự xóa sau 24h), quản lý group và fanpage, kết bạn, follow và block người dùng. Các tính năng chính bao gồm chat đầy đủ (lịch sử, sticker, reaction, sửa/xóa tin nhắn), social features toàn diện, và chi phí vận hành tối ưu.

_Lợi ích và hoàn vốn đầu tư (ROI)_  
Giải pháp tạo nền tảng mạng xã hội riêng với toàn quyền kiểm soát dữ liệu và khả năng tùy chỉnh cao, đồng thời cung cấp nguồn dữ liệu cho nghiên cứu AI/ML (phân tích cảm xúc, hệ thống gợi ý). Nền tảng thay thế giải pháp enterprise đắt đỏ thông qua hệ thống tự quản lý, đơn giản hóa giao tiếp nội bộ, và cải thiện engagement. Chi phí hàng tháng ước tính $90-120 USD cho 100 users (tự ước tính chưa dùng công cụ của AWS để tính), tổng cộng $1,080-1,440 USD cho 12 tháng. Thời gian hoàn vốn 3–6 tháng nhờ tiết kiệm chi phí license và khả năng monetization.

### 3. Kiến trúc giải pháp

Nền tảng áp dụng kiến trúc Client-Server với AWS Cloud Infrastructure để quản lý 100 người dùng đồng thời, có thể mở rộng lên 500. Frontend React được host trên S3 và phân phối qua CloudFront CDN. Traffic đi qua Application Load Balancer (hỗ trợ HTTP/HTTPS và WebSocket) đến ECS Fargate containers chạy .NET 8 backend với SignalR. Database chính là RDS SQL Server (Single-AZ cho tiết kiệm), media files lưu trong S3 (phân phối qua CloudFront). VPC với Public/Private Subnets và Security Groups đảm bảo network isolation. AWS DMS migration database lên cloud, CloudWatch monitoring.

![Kiến trúc AWS Infrastructure](./images/aws-social-media.png)

_Dịch vụ AWS sử dụng_

- _Amazon ECS + Fargate_: Chạy .NET 8 backend containers, auto-scaling
- _Amazon ECR_: Lưu trữ Docker images
- _Application Load Balancer_: Phân phối traffic, hỗ trợ WebSocket cho SignalR
- _Amazon RDS (SQL Server)_: Database chính, Single-AZ deployment
- _AWS DMS_: Migration database từ on-premise lên RDS
- _Amazon S3_: Lưu trữ frontend (bucket 1) và media files (bucket 2)
- _Amazon CloudFront_: CDN cho frontend và media distribution
- _Amazon VPC_: Network isolation với public/private subnets
- _Security Groups_: Firewall rules cho ALB, ECS, RDS
- _AWS Route 53_: DNS management (tùy chọn)
- _Amazon CloudWatch_: Logs, metrics, alarms

_Thiết kế thành phần_

- _Frontend_: React app host trên S3, phân phối qua CloudFront, truy cập backend qua HTTPS/WebSocket
- _Load Balancer_: ALB route traffic đến ECS tasks, sticky sessions cho SignalR
- _Backend Services_: ECS Fargate chạy 4 tasks (2 REST API + 2 SignalR Hub)
- _Database_: RDS SQL Server lưu users, posts, messages, stories, groups, pages, relationships
- _Storage_: S3 lưu avatars, post media, story media; CloudFront cache và phân phối
- _Authentication_: JWT tokens, SendGrid gửi verification emails
- _Monitoring_: CloudWatch thu thập logs và metrics từ ECS, ALB, RDS

### 4. Triển khai kỹ thuật

_Các giai đoạn triển khai_  
Dự án gồm 2 phần — phát triển backend/frontend và triển khai AWS infrastructure — trải qua 4 giai đoạn:

1. _Lập kế hoạch và thiết kế kiến trúc_: Nghiên cứu .NET 8, SignalR, React, AWS services và thiết kế database schema, system architecture (Tháng 1, Tuần 1-2)
2. _Phát triển Core Features và tiếp tục nghiên cứu kiến trúc AWS_: Code authentication, user management, post system, story feature (Tháng 1 Tuần 3 - Tháng 2)
3. _Phát triển Real-time Features_: Implement SignalR chat (1-1 và nhóm), notifications (Tháng 2-3)
4. _Tối ưu, triển khai_: Đóng gói container, AWS deployment với CDK/CloudFormation (Tháng 3)

_Yêu cầu kỹ thuật_

- _Backend_: .NET 8 với SignalR (WebSocket), Entity Framework Core, JWT authentication. Đóng gói ứng dụng với Docker, push images lên ECR, deploy lên ECS Fargate với 4 tasks (2 API + 2 SignalR).
- _Frontend_: React với SignalR Client, Tailwind CSS. Build static files deploy lên S3, phân phối thông qua dịch vụ CloudFront.
- _Database_: SQL Server với schema: Users, Posts, Comments, Reactions, Messages, Conversations, GroupChats, Stories, Groups, Pages, Friendships, Follows. Tối ưu bằng cách thêm các Indexes cho các bảng có liên kết để tối ưu hóa. Sử dụng AWS DMS để migrate từ local lên RDS.
- _Infrastructure_: Sử dụng AWS CDK/CloudFormation để cấu hình VPC, Subnets, Security Groups, ALB, ECS Cluster, RDS, S3, CloudFront. Xây dựng quy trình CI/CD với GitHub Actions: build → kiểm thử → đẩy lên ECR → cập nhật dịch vụ ECS → triển khai frontend lên S3.

### 5. Lộ trình & Mốc triển khai

- _Trước thực tập (Tháng 0)_: Tự học .NET, tìm hiểu cơ bản về React
- _Thực tập (Tháng 1–3)_:
  - Tháng 1:
    - Tuần 1-2: Thiết kế kiến trúc, thiết kế cơ sở dữ liệu, thiết lập AWS
    - Tuần 3-4: Xác thực người dùng, API người dùng
  - Tháng 2:
    - Tuần 5-6: Hệ thống bài đăng
    - Tuần 7-8: Nhóm, Trang
    - Tuần 9-10: Chat 1-1 với SignalR
  - Tháng 3:
    - Tuần 11: Chat nhóm, Thông báo
    - Tuần 12: Kiểm thử, đóng gói container, triển khai AWS, ra mắt production
- _Sau triển khai_: Giám sát, bảo trì, nâng cấp tính năng trong 6-12 tháng

### 6. Ước tính ngân sách

_Chi phí hạ tầng AWS_ (cho 100 người dùng)

- Amazon ECS Fargate: ~80 USD/tháng (4 tasks: 2 API + 2 SignalR, tương đương t3.small mỗi task)
- Application Load Balancer: ~20 USD/tháng
- Amazon RDS SQL Server: ~30 USD/tháng (db.t3.micro, 20GB, Single-AZ)
- Amazon S3: ~2 USD/tháng (lưu trữ 50GB)
- CloudFront: ~5 USD/tháng (truyền tải 100GB dữ liệu)
- Data Transfer: ~10 USD/tháng (dữ liệu ra ngoài)
- Amazon ECR: ~1 USD/tháng
- CloudWatch: ~5 USD/tháng (nhiều logs hơn do 4 tasks)
- AWS Secrets Manager: ~1 USD/tháng
- Route 53: ~1 USD/tháng (tùy chọn)

_Tổng_: ~155 USD/tháng, 1,860 USD/12 tháng

_Tối ưu với AWS Free Tier_: ~90-120 USD/tháng, 1,080-1,440 USD/12 tháng

_Chi phí phát triển_

- Phần mềm: 0 USD (Visual Studio Community, VS Code, Git - miễn phí)
- Tên miền: ~12 USD/năm
- SendGrid: 0 USD (gói miễn phí: 100 email/ngày)

_Tổng_: ~12 USD/năm cho tên miền

### 7. Đánh giá rủi ro

_Ma trận rủi ro_

- Tải người dùng cao: Ảnh hưởng trung bình, xác suất thấp
- Lỗi cơ sở dữ liệu: Ảnh hưởng cao, xác suất thấp
- Vi phạm bảo mật: Ảnh hưởng cao, xác suất trung bình
- Vượt ngân sách: Ảnh hưởng thấp, xác suất thấp

_Chiến lược giảm thiểu_

- Tải người dùng: Tự động mở rộng ECS khi cần, cân bằng tải ALB, tối ưu chỉ mục cơ sở dữ liệu
- Cơ sở dữ liệu: Sao lưu tự động hàng ngày, khôi phục theo thời điểm, có thể nâng cấp lên Multi-AZ nếu cần
- Bảo mật: AWS WAF, xác thực JWT, làm sạch đầu vào, mã hóa HTTPS/WSS, Security Groups
- Chi phí: Cảnh báo thanh toán CloudWatch (ngưỡng 100 USD/tháng), tắt tài nguyên không dùng

_Kế hoạch dự phòng_

- Khôi phục từ bản sao RDS nếu cơ sở dữ liệu lỗi
- Thu nhỏ quy mô instance nếu vượt ngân sách
- Sử dụng CloudFormation rollback nếu có vấn đề triển khai

### 8. Kết quả kỳ vọng

_Cải tiến kỹ thuật_: Chat thời gian thực với thời gian phản hồi < 100ms. Thời gian phản hồi API < 300ms. Hỗ trợ 100 người dùng đồng thời, có thể mở rộng lên 500. Thời gian hoạt động 99%.

_Giá trị dài hạn_: Nền tảng dữ liệu 6 tháng+ cho nghiên cứu AI/ML (phân tích cảm xúc, hệ thống gợi ý). Kinh nghiệm phát triển full-stack với công nghệ hiện đại. Chuyên môn về AWS cloud và thực hành DevOps. Có thể tái sử dụng/mở rộng cho các dự án tương lai (gọi video, phát trực tiếp, thương mại điện tử).
