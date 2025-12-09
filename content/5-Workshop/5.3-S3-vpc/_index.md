---
title: "Route 53 and VPC Network Configuration"
date: 2025-12-09T10:25:00+07:00
weight: 2
chapter: false
pre: "<b>5.3</b> "
---

This section covers domain registration, SSL/TLS certificate configuration, and setting up the Virtual Private Cloud (VPC) for backend resources.

## 3.1. Route 53 and ACM (SSL Certificate) Configuration

### 3.1.1. Domain Registration

1.  Go to the **Route 53** service and select **Register domain**.

![First, we go to the route 53 service on aws and select register domain](./images/Route_53_1.png)

2.  Enter the desired domain name and choose the domain extension type (e.g., select `.click` for affordability).

![Enter the name, select the type to purchase, here we choose .click for cheaper](./images/Route_53_2.png)

3.  Click **Select** and proceed to checkout.

![Click select and proceed to payment](./images/Route_53_3.png)

4.  Enter contact information and click **Next**.

![Enter information and click next](./images/Route_53_4.png)

5.  Review the information and click **Submit** to finalize the purchase.

![Check the information and click submit](./images/Route_53_5.png)

6.  The newly purchased domain appears in the list.

![The newly purchased domain appears](./images/Route_53_6.png)

### 3.1.2. Create SSL Certificate using ACM

1.  Go to the **ACM (AWS Certificate Manager)** service, and select **Request a certificate**.

![Go to the ACM service, request certification](./images/Route_53_7.png)

2.  Click **Next** (or keep the default **Public certificate**).

![Click next](./images/Route_53_8.png)

3.  Select the recently purchased domain and click **Request**. Note: two domain names are needed here (e.g., `social-sgu-media.click` and `*.social-sgu-media.click`).

![Select the newly purchased domain and click request, here 2 domains are needed](./images/Route_53_9.png)

4.  After the request, create CNAME records to validate the domain through Route 53.

![The successfully created record will be visible](./images/Route_53_10.png)

### 3.1.3. Update Certificate and Domain for CloudFront

1.  Go back to the CloudFront Distribution, select the Distribution, and go to **Settings** (or **General**), then select **Edit**.

![Go back to cloud front to update the domain for it](./images/Route_53_11.png)

2.  Enter the purchased domain in the **Alternate domain names (CNAMEs)** field.

![Enter the purchased domain](./images/Route_53_12.png)

3.  Select the SSL certificate (**Custom SSL certificate**) created using ACM and click **Next**.

![Select the license and click next](./images/Route_53_13.png)

4.  Finally, click **Add domains** (or **Save changes**).

![Finally click add domains](./images/Route_53_14.png)

### 3.1.4. Create Route 53 Record pointing to CDN

1.  In Route 53, go to **Hosted zones**, select the purchased domain, and click **Create record**.
2.  Create the record: select **Type A**, choose **Alias** pointing to the **CloudFront Distribution**, and click **Create records**.

![Create record, choose type A, choose route to cdn and click create](./images/Route_53_15.png)

3.  Routing is successful. Verify by accessing the domain in the browser.

![Route successful, check by logging into the domain](./images/Route_53_16.png)

## 3.2. VPC (Virtual Private Cloud) Setup

### 3.2.1. Create VPC

1.  Go to the **VPC** service and click **Create VPC**.

![First, we go to the VPC service and click create](./images/VPC_1.png)

2.  Set a name and choose an IP range (e.g., `10.0.0.0/16`).

![Set a name, choose an IP range, here we choose 10.0.0.0/16](./images/VPC_2.png)

3.  Click **Create**.

![Then click create](./images/VPC_3.png)

4.  VPC creation is successful.

![VPC creation is successful](./images/VPC_4.png)

### 3.2.2. Create and Attach Internet Gateway

1.  Create an **Internet Gateway (IGW)**.

![We create an internet gateway to attach to the vpc to be able to access from the internet](./images/VPC_5.png)

2.  Creation is successful.

![Creation is successful](./images/VPC_6.png)

3.  Attach it to the newly created VPC (Attach to VPC).

![We attach it to the vpc](./images/VPC_7.png)

4.  Attachment is successful.

![Attachment is successful](./images/VPC_8.png)

### 3.2.3. Create Subnets

We create 4 Subnets: 2 Public Subnets (for ALB/NAT Gateway) and 2 Private Subnets (1 for ECS, 1 for RDS), each in 2 different Availability Zones to ensure high availability.

1.  Go to the **Subnets** tab and click **Create subnet**.
2.  **Private Subnet for RDS** (e.g., `Private-RDS-A`): Set a name, select the VPC, select the Availability Zone (AZ), and create an IP range (e.g., `10.0.10.0/24`).

![First is the private subnet for RDS, we go to the subnet tab, set a name, select vpc, az, create an ip range](./images/Subnet_1.png)

3.  Click **Create**.

![We click create](./images/Subnet_2.png)

4.  Similarly, create the remaining 3 Subnets:
    - `Private-RDS-B` (Different AZ, different IP range)
    - `Private-ECS-A` (Different AZ, different IP range)
    - `Public-A` (Different AZ, different IP range)
    - `Public-B` (Different AZ, different IP range)

![Similarly we create more private subnet and public subnet](./images/Subnet_3.png)
![Similarly we create more private subnet and public subnet](./images/Subnet_4.png)

5.  The created Subnets are now available.

![We have the 4 subnets created](./images/Subnet_5.png)
![We have the 4 subnets created](./images/Subnet_6.png)
![We have the 4 subnets created](./images/Subnet_7.png)

---
