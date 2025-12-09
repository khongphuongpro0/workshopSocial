---
title: "Create NAT Gateway and Configure Route Tables"
date: 2025-12-09T10:30:00+07:00
weight: 3
chapter: false
pre: "<b>5.4.</b> "
---

In this step, we will create a **NAT Gateway** to allow Private Subnets to access the internet (e.g., to pull packages from ECR) without being directly accessible from the outside. We will then configure the corresponding **Route Tables**.

## 4.1. Create NAT Gateway

1.  Go to the VPC service, **NAT Gateways** tab, and click **Create NAT Gateway**.

![Create Nat GateWay](./images/Subnet_8.png)

2.  Set a name, choose the mode as **Zonal**, select a created **Public Subnet** (e.g., `Public-A`), select an **Elastic IP** (create a new one if necessary), and click **Create NAT Gateway**.

![Set a name, choose zonal mode for self-configuration, select the created public subnet, elastic ip and click create](./images/NatGateWay_2.png)

3.  Creation is successful.

![Creation is successful](./images/NatGateWay_3.png)

---

## 4.2. Create and Configure Route Tables

We will create 3 Route Tables corresponding to 3 types of Subnets: Private-RDS, Private-ECS, and Public.

1.  Go to the **Route Tables** tab and select **Create route table**.

![Go to the route table tab and select create new](./images/RouteTable_1.png)

2.  Create 3 Route Tables consecutively: `Route-RDS`, `Route-ECS`, `Route-Public`.

![We will sequentially create 3 route tables corresponding to 3 subnets](./images/RouteTable_2.png)
![We will sequentially create 3 route tables corresponding to 3 subnets](./images/RouteTable_3.png)
![We will sequentially create 3 route tables corresponding to 3 subnets](./images/RouteTable_4.png)

### 4.2.1. Configure Route Table for RDS Subnets (Private)

1.  Select `Route-RDS`, switch to the **Subnet Associations** tab, and select **Edit subnet association**.

![Click on the route table, go to the subnet association tab and select edit subnet association](./images/RouteTable_5.png)

2.  Select the RDS Subnets (both A and B) and click **Save**.

![Select rds subnet and click save](./images/RouteTable_6.png)

3.  **Note:** RDS Subnets do not require internet access, so no special Route needs to be added.

### 4.2.2. Configure Route Table for ECS Subnets (Private)

1.  Similarly, associate the ECS Subnets (both A and B) with `Route-ECS`.

![Similarly for ecs subnet and public](./images/RouteTable_7.png)

2.  Configure a Route that allows internet access via the **NAT Gateway**:
    - Go to the **Routes** tab, and select **Edit routes**.
    - Add a Route: **Destination** is `0.0.0.0/0`, **Target** is the created **NAT Gateway**.

![In the public subnet we configure additional routes for Nat GateWay to be able to pull images from ECR](./images/RouteTable_8.png)

### 4.2.3. Configure Route Table for Public Subnets

1.  Associate the Public Subnets (both A and B) with `Route-Public`.

![Specifically for public subnet we will have to configure in the route tab, edit route](./images/RouteTable_9.png)

2.  Configure a Route that allows internet access via the **Internet Gateway (IGW)**:
    - Go to the **Routes** tab, and select **Edit routes**.

![We will configure the internet gateway for it by clicking edit route](./images/RouteTable_10.png)

3.  Add a Route: **Destination** is `0.0.0.0/0`, **Target** is the created **Internet Gateway**.

![and attach internet gateway](./images/RouteTable_11.png)

4.  Add the Public Subnets to the Route Table.

![And then add subnet similarly](./images/RouteTable_12.png)
