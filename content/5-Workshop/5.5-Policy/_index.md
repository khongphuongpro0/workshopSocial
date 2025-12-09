---
title: "Set up Subnet Group and RDS Database"
date: 2025-12-09T10:35:00+07:00
weight: 4
chapter: false
pre: "<b>5.5.</b> "
---

In this step, we will create a **DB Subnet Group** (mandatory for RDS) and then initialize **Amazon RDS (Relational Database Service)** for the backend database.

## 5.1. Create DB Subnet Group

1.  In the **RDS** service, go to the **Subnet Groups** tab, and click **Create DB Subnet Group**.

![We select the subnet group tab in the rds service, set a name, select the vpc we just created](./images/SubnetGroup_1.png)

2.  Set a name (e.g., `social-media-db-subnet-group`), and select the created VPC.
3.  Select the 2 corresponding AZs and the 2 **Private Subnets** created for RDS (`Private-RDS-A` and `Private-RDS-B`).

![Next, select 2 corresponding azs and 2 private subnets in 2 different azs](./images/SubnetGroup_2.png)

4.  Subnet Group creation is successful.

![Subnet Group creation is successful](./images/SubnetGroup_3.png)

## 5.2. Create RDS Database (MySQL)

1.  Go to the **RDS** service and click **Create database**.

![Go to RDS service and click create database](./images/RDS_1.png)

2.  Select the **MySQL** Engine.

![Here we use mysql so we will choose mysql](./images/RDS_2.png)

3.  Choose the version and select the **Free tier** **Template** to save costs.

![Next we choose the version and template, since my account is still eligible for free tier, I will choose free tier to save costs](./images/RDS_3.png)

4.  Set the Database name, the account name (**Master username**), and the password (**Master password**).

![We set the database name, account name, and password](./images/RDS_4.png)

5.  Select the **DB instance class** as **t4g.micro** (Free tier).

![Here because it's free tier, we will choose t4g.micro](./images/RDS_5.png)

6.  Select **Storage** as **gp3**.

![Select Storage as gp3](./images/RDS_6.png)

7.  Select the VPC and the **Subnet Group** created above.

![Select vpc and subnet group created above](./images/RDS_7.png)

8.  In the **Public access** section, select **No** (since this is a Private Subnet).

![in the public access section we choose no](./images/RDS_8.png)

9.  Then click **Create database**. Creation is successful.

### 5.2.1. Temporarily Modify Public Access and Migration

1.  To perform the initial database **migration**, we need to temporarily change **Public access** to **Yes** (DMS can be used for larger databases).

![We need to adjust public access to be able to migrate the database (DMS can be used for large databases)](./images/RDS_9.png)

2.  Modification is successful.

![Modification is successful](./images/RDS_10.png)

3.  Perform Database Migration/Import: You can use MySQL Workbench or the Command Line.

![Here I use the command line](./images/RDS_11.png)

4.  Verify by connecting MySQL Workbench to RDS. The database contains data.

![Verify by connecting mysql workbench to rds](./images/RDS_12.png)
