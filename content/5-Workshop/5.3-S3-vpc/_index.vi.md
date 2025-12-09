---
title: "Cấu hình Route 53 và Mạng VPC"
date: 2025-12-09T10:25:00+07:00
weight: 2
chapter: false
pre: "<b>5.3</b> "
---

Phần này bao gồm việc đăng ký tên miền, cấu hình chứng chỉ SSL/TLS, và thiết lập mạng ảo riêng (VPC) cho các tài nguyên backend.

## 3.1. Cấu hình Route 53 và ACM (Chứng chỉ SSL)

### 3.1.1. Đăng ký Domain

1.  Vào dịch vụ **Route 53** và chọn **Register domain**.

![Đầu tiên ta sẽ vào dịch vụ route 53 của aws và chọn register domain](./images/Route_53_1.png)

2.  Đặt tên domain mong muốn và chọn loại đuôi miền (ví dụ: chọn `.click` cho rẻ).

![Đặt tên, chọn loại muốn mua, ở đây sẽ chọn .click cho rẻ](./images/Route_53_2.png)

3.  Nhấn **Select** và tiến tới thanh toán.

![Nhấn select và tiến tới thanh toán](./images/Route_53_3.png)

4.  Nhập thông tin liên hệ và ấn **Next**.

![Nhập thông tin và ấn next](./images/Route_53_4.png)

5.  Kiểm tra thông tin và ấn **Submit** để hoàn tất việc mua.

![Kiểm tra thông tin và ấn submit](./images/Route_53_5.png)

6.  Ta thấy domain mới mua trong danh sách.

![Ta thấy domain mới mua](./images/Route_53_6.png)

### 3.1.2. Tạo Chứng chỉ SSL bằng ACM

1.  Vào dịch vụ **ACM (AWS Certificate Manager)**, chọn **Request a certificate** (Yêu cầu chứng chỉ).

![Vào dịch vụ ACM, request certification](./images/Route_53_7.png)

2.  Ấn **Next** (hoặc giữ mặc định **Public certificate**).

![Ấn next](./images/Route_53_8.png)

3.  Chọn tên miền vừa mới mua và nhấn **Request**. Ở đây cần 2 tên miền (ví dụ: `social-sgu-media.click` và `*.social-sgu-media.click`).

![Chọn tên miền vừa mới mua và nhấn request, ở đây cần 2 tên miền lận nha](./images/Route_53_9.png)

4.  Sau khi request, tạo các bản ghi CNAME để xác thực tên miền qua Route 53.

![Ta sẽ thấy record vừa tạo thành công](./images/Route_53_10.png)

### 3.1.3. Cập nhật Chứng chỉ và Domain cho CloudFront

1.  Vào lại CloudFront Distribution, chọn Distribution và vào **Settings** (hoặc **General**), chọn **Edit**.

![Ta vào lại cloud front cập nhật domain cho nó](./images/Route_53_11.png)

2.  Nhập domain đã mua vào mục **Alternate domain names (CNAMEs)**.

![Nhập domain đã mua](./images/Route_53_12.png)

3.  Chọn giấy phép SSL (**Custom SSL certificate**) đã tạo bằng ACM và ấn **Next**.

![Chọn giấy phép và ấn next](./images/Route_53_13.png)

4.  Cuối cùng ấn **Add domains** (hoặc **Save changes**).

![Cuối cùng ấn add domains](./images/Route_53_14.png)

### 3.1.4. Tạo Record Route 53 trỏ về CDN

1.  Trong Route 53, vào **Hosted zones**, chọn domain đã mua và nhấn **Create record**.
2.  Tạo record: chọn **Type A**, chọn **Alias** trỏ đến **CloudFront Distribution** và ấn **Create records**.

![Tạo record, chọn type A, chọn route đến cdn và ấn tạo](./images/Route_53_15.png)

3.  Route thành công. Kiểm tra bằng cách truy cập domain trên trình duyệt.

![Route thành công, kiểm tra bằng cách đăng nhập vào domain](./images/Route_53_16.png)

## 3.2. Thiết lập VPC (Mạng ảo riêng)

### 3.2.1. Tạo VPC

1.  Vào dịch vụ **VPC** và nhấn **Create VPC**.

![Đầu tiên ta vào dịch vụ VPC và nhấn create](./images/VPC_1.png)

2.  Đặt tên, chọn dải IP (ví dụ: `10.0.0.0/16`).

![Đặt tên, chọn dải IP ở đây ta chọn 10.0.0.0/16](./images/VPC_2.png)

3.  Nhấn **Create**.

![Sau đó ta nhấn create](./images/VPC_3.png)

4.  VPC được tạo thành công.

![VPC được tạo thành công](./images/VPC_4.png)

### 3.2.2. Tạo và Gắn Internet Gateway

1.  Tạo **Internet Gateway (IGW)**.

![Ta tạo internet gateway để attach vào vpc để có thể truy cập từ internet vào](./images/VPC_5.png)

2.  Tạo thành công.

![Tạo thành công](./images/VPC_6.png)

3.  Gắn vào VPC (Attach to VPC) vừa tạo.

![Ta gán vào vpc](./images/VPC_7.png)

4.  Gán thành công.

![Gán thành công](./images/VPC_8.png)

### 3.2.3. Tạo Subnet

Ta tạo 4 Subnet: 2 Public Subnet (cho ALB/NAT Gateway) và 2 Private Subnet (1 cho ECS, 1 cho RDS), mỗi loại ở 2 Availability Zone khác nhau để đảm bảo tính sẵn sàng cao.

1.  Vào tab **Subnets** và nhấn **Create subnet**.
2.  **Private Subnet cho RDS** (ví dụ: `Private-RDS-A`): Đặt tên, chọn VPC, chọn Availability Zone (AZ) và tạo dải IP (ví dụ: `10.0.10.0/24`).

![Đầu tiên là private subnet cho RDS, ta vào tab subnet, đặt tên, chọn vpc, az, tạo dải ip](./images/Subnet_1.png)

3.  Nhấn **Create**.

![Ta nhấn tạo](./images/Subnet_2.png)

4.  Tương tự, tạo thêm 3 Subnet còn lại:
    - `Private-RDS-B` (AZ khác, dải IP khác)
    - `Private-ECS-A` (AZ khác, dải IP khác)
    - `Public-A` (AZ khác, dải IP khác)
    - `Public-B` (AZ khác, dải IP khác)

![Tương tự ta tạo thêm private subnet và public subnet](./images/Subnet_3.png)
![Tương tự ta tạo thêm private subnet và public subnet](./images/Subnet_4.png)

5.  Ta có được các Subnet đã tạo xong.

![Ta có được 4 subnet ta đã tạo xong](./images/Subnet_5.png)
![Ta có được 4 subnet ta đã tạo xong](./images/Subnet_6.png)
![Ta có được 4 subnet ta đã tạo xong](./images/Subnet_7.png)

---
