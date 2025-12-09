---
title: "ECR, Docker, Security Group, ALB, ECS Service và Kết thúc"
date: 2025-12-09T10:40:00+07:00
weight: 5
chapter: false
pre: "<b>5.6.</b> "
---

Đây là các bước cuối cùng để đóng gói ứng dụng Backend, tạo các thành phần bảo mật/Load Balancer và triển khai lên **ECS Fargate**.

## 6.1. Docker, ECR và Push Image

### 6.1.1. Tạo ECR (Elastic Container Registry)

1.  Vào dịch vụ **ECR** và tạo Repository (ví dụ: `social-media-backend`).

![Ta vào comman line nhập các configure sau đó tạo](./images/ECR_1.png)

2.  Đã có ECR.

![Đã có ecr](./images/ECR_2.png)

### 6.1.2. Dockerfile và Build Image

1.  Tạo **Dockerfile** ngang hàng với folder backend (sử dụng cấu trúc Onion).

![Tiếp đến là build file lên docker, vì là cấu trúc onion nên ta sẽ đặt Dockerfile ở ngang với folder backend, với src chính là folder backend](./images/ECR_3.png)

2.  Cấu hình file Docker.

![Tiếp đến ta cấu hình file docker](./images/ECR_4.png)

3.  Chạy lệnh `docker build -t social-media-backend .` để build. Đóng gói thành công.

![Và chạy lệnh docker build -t social-media-backend . để build. Đóng gói thành công](./images/ECR_5.png)

### 6.1.3. Đăng nhập và Push Image lên ECR

1.  Đăng nhập vào ECR bằng command line, verify tag, kiểm tra lại bằng `docker image`.

![Đăng nhập vào ECR bằng comman line, verify tag, kiểm tra lại bằng docker image](./images/ECR_6.png)

2.  Chạy lệnh để push image lên ECR. Hoàn thành việc push.

![Sau đó chạy lệnh để push image lên ecr. Hoàn thành việc push](./images/ECR_7.png)

## 6.2. Tạo Security Group

Ta tạo 3 Security Group: 1 cho ALB, 1 cho ECS/Backend, 1 cho RDS/Database.

### 6.2.1. Security Group cho ALB (Internet-Facing)

1.  Chọn **Create security group**. Đặt tên, chọn VPC đã tạo.
2.  Ở phần **Inbound rules**, chọn **HTTP** và **HTTPS** với **Source** là **mọi nơi** (`0.0.0.0/0` và `::/0`), ấn **Create**.

![Đặt tên, chọn vpc đã tạo và ở phần inbound rules chọn http và https với source là mọi nơi, ấn tạo](./images/SecurityGroup_2.png)

### 6.2.2. Security Group cho ECS (Backend)

1.  Đặt tên, chọn VPC. **Lưu ý:** Port của Dockerfile là **8080**, nên **Inbound rule** sẽ là **Custom TCP** Port **8080**.
2.  **Source** sẽ là **Security Group** của **ALB** vừa tạo (chỉ ALB được phép gửi traffic đến ECS).

![Tiếp đến ta tạo security group cho ecs, có vài điều cần lưu ý là port của dockerfile, trong dockerfile tôi để port là 8080 nên sẽ để ở đây là 8080, source sẽ phải lấy của security group ALB ta vừa mới tạo](./images/SecurityGroup_3.png)

### 6.2.3. Security Group cho RDS (Database)

1.  Đặt tên, chọn VPC. **Lưu ý:** **Inbound rule** sẽ là **Port MySQL** (3306).
2.  **Source** sẽ là **Security Group** của **ECS** vừa tạo (chỉ ECS được phép truy cập RDS).

![Tiếp tục đến security group cho ecs, ở ecs thì ta chọn port mysql và source là của security group ecs ta vừa mới tạo](./images/SecurityGroup_4.png)

3.  Tổng quan ta đã có 3 Security Group.

![Tổng quan ta đã có 3 security group](./images/SecurityGroup_5.png)
![Tổng quan ta đã có 3 security group](./images/SecurityGroup_6.png)

## 6.3. Tạo Target Group và ALB

### 6.3.1. Tạo Target Group

1.  Vào **EC2** -> **Target Group**, chọn **Create target group**.

![Vào EC2 -> Target Group chọn create target group](./images/TargetGroup_1.png)

2.  Chọn **Type** là **IP address**.

![Ta chọn type là IP address](./images/TargetGroup_2.png)

3.  Đặt tên, **Port** là **8080** (trong Dockerfile), chọn VPC đã tạo.

![Đặt tên group name, port là 8080 đã cấu hình trong docker file và chọn vpc đã tạo](./images/TargetGroup_3.png)

4.  Ở mục **Healthy threshold** chọn **2**, còn lại để mặc định và ấn **Create**.

![Ở mục healthy threshold ta chọn 2, còn lại để mặc định](./images/TargetGroup_4.png)

5.  Hoàn thành việc tạo Target Group.

![Nhấn next ở trang tiếp theo và chọn create, hiển thị tạo thành công](./images/TargetGroup_5.png)

### 6.3.2. Tạo Application Load Balancer (ALB)

1.  Vào **EC2** -> **Load Balancers**, nhấn **Create Load Balancer**. Chọn loại **Application Load Balancer**.

![Cũng trong EC2 ta qua tạo Load Balancers, ta nhấn tạo. Ta chọn loại Application Load Balancer](./images/ALB_2.png)

2.  Đặt tên, chọn **Scheme** là **internet-facing**, **IP address type** là **Ipv4**.

![Đặt tên, chọn scheme là internet-facing, chọn loại ip address type là Ipv4](./images/ALB_3.png)

3.  Ở **Network mapping**, chọn 2 AZ và 2 **Public Subnet** tương ứng.

![Ở NetWork mapping, ta chọn 2 az và chọn 2 public subnet tương ứng](./images/ALB_4.png)

4.  Ở **Security group**, chọn Security Group đã tạo cho ALB.

![Ở security group thì ta chọn security ta tạo cho alb](./images/ALB_5.png)

5.  Ở **Listeners**, ta tạo 2 Listener:
    - **Listener 1 (HTTP 80)**: Cấu hình trỏ đến HTTPS.

![Listener 1 ta cấu hình nó như trong hình cho loại http](./images/ALB_6.png)

    * **Listener 2 (HTTPS 443)**: Ở **Routing action**, chọn **Forward to target group**, chọn Target Group vừa mới tạo.

![Listener 2, ở routing action ta chọn forward to target group, chọn target group vừa mới tạo](./images/ALB_7.png)

6.  Ở phần cấu hình an toàn cho Listener (HTTPS), chọn **Certification** đã tạo ở phần Route 53 (ACM).

![Ở phần cấu hình an toàn cho listener ta chọn Certification đã tạo ở phần route 53](./images/ALB_8.png)

7.  Nhấn **Create**. Màn hình hiển thị tạo thành công.

![Sau đó nhấn tạo, màn hình hiển thị tạo thành công](./images/ALB_9.png)

## 6.4. Tạo ECS Cluster và Service

### 6.4.1. Tạo ECS Cluster

1.  Vào dịch vụ **ECS**, tab **Clusters**, nhấn **Create Cluster**.

![Vào dịch vụ ECS, tab Cluster, nhấn tạo cluster](./images/ECScluster_1.png)

2.  Đặt tên và chọn kiến trúc là **Fargate only**.

![Ta đặt tên và chọn kiến trúc, ở đây kiến trúc sẽ sử dụng là Farget only](./images/ECScluster_2.png)

3.  Nhấn **Create**. Tạo thành công.

![ECScluster_3.png](./images/ECScluster_3.png)

### 6.4.2. Cấu hình Task Definition

1.  Vào tab **Task definitions**, nhấn **Create new task definition**.

![Cùng ở service ECS, ta vào tab Task definitions, nhấn tạo task](./images/ECScluster_4.png)

2.  Chọn tạo bằng file **JSON** (góc trên phải màn hình).

![Ta sẽ chọn ở góc phía trên phải màn hình tạo bằng file json](./images/ECScluster_5.png)

3.  Sử dụng cấu trúc file JSON chứa các thông tin như: image của ECR, port tương ứng, biến môi trường (kết nối database), và CORS (cho phép domain đã mua).

![Với cấu trúc file json như sau, lần lượt là image của ecr, port tương ứng, biến môi trường, biến kết nối database, và CORS cho phép địa chỉ domain đã mua, ấn tạo](./images/ECScluster_6.png)
![Với cấu trúc file json như sau, lần lượt là image của ecr, port tương ứng, biến môi trường, biến kết nối database, và CORS cho phép địa chỉ domain đã mua, ấn tạo](./images/ECScluster_7.png)

4.  Ấn **Create**. Tạo thành công.

![Tạo thành công](./images/ECScluster_8.png)

### 6.4.3. Tạo ECS Service

1.  Vào Cluster vừa tạo, kéo xuống tab **Services** chọn **Create Service**.

![Vào cluster chọn cluster mới tạo](./images/ECSService_1.png)
![Kéo xuống tab service chọn tạo service](./images/ECSService_2.png)

2.  Ở **Service detail**, chọn **Task** mới tạo, đặt tên **Service name**.

![Ở phần Service detail chọn task mới tạo, đặt tên service name](./images/ECSService_3.png)

3.  Ở **Environment**, chọn **Launch type** (Fargate).

![Ở environment chọn kiểu là Launch type và để mặc định các phần khác](./images/ECSService_4.png)

4.  Ở **Deployment configuration**, để mặc định.

![Ở mục deployment configuration ta để mặc định](./images/ECSService_5.png)

5.  Ở **Networking**, chọn VPC đã tạo, 2 **Private Subnet** tương ứng với ECS và tắt chức năng **Public IP**.

![Ở mục networking, ta chọn vpc ta tạo, 2 private subnet tương ứng với ecs và rds, tắt chức năng public IP](./images/ECSService_6.png)

6.  Ở phần **Load balancing**, tick vào **Use load balancing**.
    - Sử dụng **ALB** đã tồn tại và dùng **Listener** đã tạo trước đó.

![Ở phần Load balancing ta tick vào nút use load balancing. Sử dụng ALB đã tồn tại , và dùng listener đã tạo trước đó](./images/ECSService_7.png)
![Sử dụng ALB đã tồn tại , và dùng listener đã tạo trước đó](./images/ECSService_8.png)

7.  Chọn **Target Group** đã tồn tại và chọn Target Group đã làm ở bước trước đó.

![Cuối cùng chọn target group đã tồn tại và chọn target group ta đã làm ở bước trước đó](./images/ECSService_9.png)

8.  Cuối cùng nhấn **Create**. Task đã chạy thành công.

![Cuối cùng nhấn create, task đã chạy thành công](./images/ECSService_10.png)

### 6.4.4. Cấu hình Record Route 53 trỏ về ALB

1.  Tạo record Route 53, cấu hình trỏ đến **ALB** đã tạo. **Name** là `api` (ví dụ: `api.social-sgu-media.click`), và ấn **Create**.

![Sau đó ta tạo record route 53, cấu hình cho qua ALB đã tạo, name là api, và ấn tạo](./images/ECSService_11.png)

2.  Tạo thành công.

![Tạo thành công](./images/ECSService_12.png)

## 6.5. Kết quả

Chạy thử với URL API đã cấu hình (ví dụ: `https://api.social-sgu-media.click/`).

![Vậy ta đã hoàn thành xong, ta chạy thử với url là https://api.social-sgu-media.click/](./images/ECSService_13.png)

Thành công! Vậy là ta đã hoàn thành xong Workshop triển khai ứng dụng Social Media trên AWS.
