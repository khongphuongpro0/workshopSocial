---
title: "Tạo Nat Gateway và Cấu hình Route Table"
date: 2025-12-09T10:30:00+07:00
weight: 3
chapter: false
pre: "<b>5.4.</b> "
---

Trong bước này, ta sẽ tạo **NAT Gateway** để cho phép các Private Subnet truy cập internet (ví dụ: để tải gói từ ECR) mà không bị truy cập trực tiếp từ bên ngoài, sau đó cấu hình các **Route Table** tương ứng.

## 4.1. Tạo Nat Gateway

1.  Vào dịch vụ VPC, tab **NAT Gateways**, nhấn **Create NAT Gateway**.

![Tạo Nat GateWay](./images/Subnet_8.png)

2.  Đặt tên, chọn chế độ là **Zonal**, chọn **Public Subnet** đã tạo (ví dụ: `Public-A`), **Elastic IP** (tạo mới nếu chưa có) và ấn **Create NAT Gateway**.

![Đặt tên chọn mod là zonal để tự cấu hình, chọn subnet public đã tạo, elastic ip và ấn tạo](./images/NatGateWay_2.png)

3.  Tạo thành công.

![Tạo thành công](./images/NatGateWay_3.png)

## 4.2. Tạo và Cấu hình Route Table

Ta sẽ tạo 3 Route Table tương ứng với 3 loại Subnet: Private-RDS, Private-ECS, và Public.

1.  Vào tab **Route Tables** và chọn **Create route table**.

![Vào tab route table và chọn tạo mới](./images/RouteTable_1.png)

2.  Lần lượt tạo 3 Route Table: `Route-RDS`, `Route-ECS`, `Route-Public`.

![Ta sẽ lần lượt tạo 3 route table tương ứng với 3 subnet](./images/RouteTable_2.png)
![Ta sẽ lần lượt tạo 3 route table tương ứng với 3 subnet](./images/RouteTable_3.png)
![Ta sẽ lần lượt tạo 3 route table tương ứng với 3 subnet](./images/RouteTable_4.png)

### 4.2.1. Cấu hình Route Table cho Subnet RDS (Private)

1.  Chọn `Route-RDS`, sang tab **Subnet Associations**, chọn **Edit subnet association**.

![Click vào route table, sang tab subnet association chọn edit subnet association](./images/RouteTable_5.png)

2.  Chọn Subnet RDS (cả A và B) và nhấn **Save**.

![Chọn subnet rds và nhấn save](./images/RouteTable_6.png)

3.  **Lưu ý:** Subnet RDS không cần truy cập internet nên không cần thêm Route đặc biệt nào.

### 4.2.2. Cấu hình Route Table cho Subnet ECS (Private)

1.  Tương tự, gán Subnet ECS (cả A và B) vào `Route-ECS`.

![Tương tự cho subnet ecs và public](./images/RouteTable_7.png)

2.  Cấu hình Route cho phép truy cập internet thông qua **NAT Gateway**:
    - Vào tab **Routes**, chọn **Edit routes**.
    - Thêm Route: **Destination** là `0.0.0.0/0`, **Target** là **NAT Gateway** đã tạo.

![Ở subnet public ta cấu hình thêm cho Nat GateWay để có thể lấy ảnh từ ECR](./images/RouteTable_8.png)

### 4.2.3. Cấu hình Route Table cho Subnet Public

1.  Gán Public Subnet (cả A và B) vào `Route-Public`.

![Riêng public subnet ta sẽ phải cấu hình trong tab route, edit route](./images/RouteTable_9.png)

2.  Cấu hình Route cho phép truy cập internet thông qua **Internet Gateway (IGW)**:
    - Vào tab **Routes**, chọn **Edit routes**.

![Ta sẽ cấu hình internet gateway cho nó bằng cách nhấn edit route](./images/RouteTable_10.png)

3.  Thêm Route: **Destination** là `0.0.0.0/0`, **Target** là **Internet Gateway** đã tạo.

![và gán internet gateway](./images/RouteTable_11.png)

4.  Thêm Subnet Public vào Route Table.

![Và sau đó add subnet tương tự](./images/RouteTable_12.png)
