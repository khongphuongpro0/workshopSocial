---
title: "Worklog Tuần 5"
date: "2024-01-15"
weight: 1
chapter: false
pre: " <b> 1.5. </b> "
---

### Mục tiêu tuần 5:

- Thiết kế kiến trúc code
- Thực hiện tạo các Layer và các lớp cơ bản để triển khai dự án
- Tìm hiểu thêm về các dịch vụ AWS, hiểu thêm về RDS, Auto Scalling Group, Amazon Load Balance.

### Các công việc cần triển khai trong tuần này:

| Thứ   | Công việc                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu                                      |
| ----- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | --------------------------------------------------- |
| 2     | - Tiếp tục tìm hiểu thêm về RDS, EC2, Security Group, Auto Scalling Group, Amazon Load Balance <br> **Thực hành:** <br>&emsp; + Thực hành tạo RDS và liên kết với EC2 để tạo thử database cơ bản                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 29/09/2025   | 29/09/2025      | <https://000005.awsstudygroup.com/vi/4-create-rds/> |
| 3 - 6 | - Triển khai kiến trúc Onion<br> - Thiết kế các Layer<br> - Thiết kể các lớp như service, Repository, IRepository <br> **Thực hành:**<br>&emsp; + Ứng dụng AI để làm nhanh cho việc thiết kế lớp IBaseRepository, BaseRepository để có code chung về lấy dữ liệu từ cơ sở dữ liệu<br>&emsp; + Làm code đặc thù cho mỗi Repository với tính năng riêng cho tất cả các lớp Repository còn lại tương ứng với các bảng như Account,Adress,BlockedUser, Comment, CommentLike,CommentMember,ConversationNickName, Conversation,District, Follow, Friend,User,UserToken,MessageAttachment, MessageReaction, MessageRead.<br>&emsp; + Thiết kế các DTO để trả về dữ liệu cho các Repository | 30/09/2025   | 05/10/2025      | DeepSeek, Claude Code                               |

### Kết quả đạt được tuần 5:

- Hiểu thêm về EC2, RDS, ASG và ALB
- Thiết kế kiến trúc Onion cho dự án
- Thiết kế thành công 1 số lớp đặc thù cho việc truy cập cơ sở dữ liệu IRepository, Repository
