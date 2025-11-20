---
title: "Worklog Tuần 8"
date: "2024-01-15"
weight: 1
chapter: false
pre: " <b> 1.8. </b> "
---

### Mục tiêu tuần 8:

- Tiếp tục cài đặt, xây dựng bổ sung thêm về các tính năng còn thiếu như JWT
- Hoàn thành chức năng gửi tin nhắn cho cuộc hội thoại cả nhóm lẫn cá nhân.
- Hoàn thành các chức năng User như đăng nhập, đăng ký, gửi mail xác nhận, quên mật khẩu.

### Các công việc cần triển khai trong tuần này:

| Thứ   | Công việc                                                                                                                                                                         | Ngày bắt đầu | Ngày hoàn thành | Nguồn tài liệu |
| ----- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | --------------- | -------------- |
| 2 - 4 | **Thực hành:** <br>&emsp; + Hoàn thành chức năng nhắn tin, kiểm thử Controller về việc nhắn tin<br>&emsp;+ Tiếp tục làm Service về kết bạn, chặn, theo dõi                        | 20/10/2025   | 22/10/2025      |
| 5     | **Thực hành:** <br>&emsp;+ Tích hợp JWT cũng như BCrypt để mã hóa mật khẩu <br>&emsp;+ Tiến hành làm đăng nhập, đăng kí <br>&emsp; + Thiết kế RDS để chuẩn bị database trên cloud | 23/10/2025   | 24/10/2025      |
| 6     | **Thực hành:** <br>&emsp; +Tiếp tục hoàn thành xong Service chức năng đăng nhập, đăng kí, bổ sung thêm chức năng về quên mật khẩu, đổi mật khẩu, tích hợp gửi mail bằng SendGrid  | 24/10/2025   | 26/10/2025      |

### Kết quả đạt được tuần 8:

- Hoàn thành xong lớp Service và Controller của chức năng:

* Gửi tin nhắn, Sticker, file, ảnh, video
* Sửa tin nhắn
* Xóa tin nhắn
* Đăng nhập
* Đăng kí
* Gửi mail để lấy lại mật khẩu
* Gửi mail để xác nhận tài khoản
  Kiểm thử thành công bằng PostMan các chức năng tương ứng
