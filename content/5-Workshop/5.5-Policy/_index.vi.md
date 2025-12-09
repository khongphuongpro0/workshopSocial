---
title: "Thiết lập Subnet Group và Database RDS"
date: 2025-12-09T10:35:00+07:00
weight: 4
chapter: false
pre: "<b>5.5.</b> "
---

Trong bước này, ta sẽ tạo **DB Subnet Group** (bắt buộc cho RDS) và sau đó khởi tạo **Amazon RDS** (Relational Database Service) cho database backend.

## 5.1. Tạo DB Subnet Group

1.  Trong dịch vụ **RDS**, vào tab **Subnet Groups**, nhấn **Create DB Subnet Group**.

![Ta chọn vào tab subnet group trong service rds, đặt tên, chọn vpc ta mới tạo](./images/SubnetGroup_1.png)

2.  Đặt tên (ví dụ: `social-media-db-subnet-group`), chọn VPC đã tạo.
3.  Chọn 2 AZ tương ứng và 2 **Private Subnet** đã tạo cho RDS (`Private-RDS-A` và `Private-RDS-B`).

![Tiếp đến chọn 2 az tương ứng và 2 private subnet ở 2 az khác nhau](./images/SubnetGroup_2.png)

4.  Tạo thành công Subnet Group.

![Tạo thành công subnet group](./images/SubnetGroup_3.png)

## 5.2. Tạo Database RDS (MySQL)

1.  Vào dịch vụ **RDS** và ấn **Create database**.

![Vào service RDS và ấn tạo database](./images/RDS_1.png)

2.  Chọn Engine **MySQL**.

![Ở đây ta dùng mysql nên sẽ chọn là mysql](./images/RDS_2.png)

3.  Chọn phiên bản và **Template** là **Free tier** để tiết kiệm chi phí.

![Tiếp đến ta chọn phiên bản và template, vì tài khoản em đang dùng vẫn còn được free tier nên sẽ chọn free tier để tiết kiệm chi phí](./images/RDS_3.png)

4.  Đặt tên Database, tên tài khoản (**Master username**) và mật khẩu (**Master password**).

![Ta đặt tên database, đặt tên tài khoản, mật khẩu](./images/RDS_4.png)

5.  Chọn **DB instance class** là **t4g.micro** (Free tier).

![Ở đây vì là free tier nên sẽ chọn là t4g.micro](./images/RDS_5.png)

6.  Chọn **Storage** là **gp3**.

![Chọn Storage là gp3](./images/RDS_6.png)

7.  Chọn VPC và **Subnet Group** đã tạo ở trên.

![Chọn vpc và subnet group đã tạo ở trên](./images/RDS_7.png)

8.  Ở phần **Public access**, chọn **No** (Vì đây là Private Subnet).

![ở phần public access ta chọn no](./images/RDS_8.png)

9.  Sau đó ấn **Create database**. Tạo thành công.

### 5.2.1. Chỉnh sửa Public Access (Tạm thời) và Migration

1.  Để **migration** database ban đầu, ta cần tạm thời chỉnh **Public access** thành **Yes** (có thể dùng **DMS** với database kích thước lớn).

![Ta cần chỉnh public access để có thể migration database lên (có thể dùng DMS với database với kích thước lớn)](./images/RDS_9.png)

2.  Ta chỉnh sửa thành công.

![Ta chỉnh sửa thành công](./images/RDS_10.png)

3.  Thực hiện Migration/Import Database: Có thể dùng MySQL Workbench hoặc Command Line.

![Ở đây em dùng comman line](./images/RDS_11.png)

4.  Kiểm tra bằng cách kết nối MySQL Workbench với RDS. Database đã có dữ liệu.

![Kiểm tra bằng cách kết nối mysql workbench với rds](./images/RDS_12.png)
