---
title: "ECR, Docker, Security Group, ALB, ECS Service, and Conclusion"
date: 2025-12-09T10:40:00+07:00
weight: 5
chapter: false
pre: "<b>5.6.</b> "
---

These are the final steps to package the Backend application, create the security/Load Balancer components, and deploy it to **ECS Fargate**.

## 6.1. Docker, ECR, and Push Image

### 6.1.1. Create ECR (Elastic Container Registry)

1.  Go to the **ECR** service and create a Repository (e.g., `social-media-backend`).

![We enter the configure command in the command line and then create](./images/ECR_1.png)

2.  ECR is now available.

![ECR is now available](./images/ECR_2.png)

### 6.1.2. Dockerfile and Build Image

1.  Create the **Dockerfile** parallel to the backend folder (using the Onion architecture structure).

![Next is building the file onto docker, because it's an onion architecture, we place the Dockerfile next to the backend folder, with src being the backend folder](./images/ECR_3.png)

2.  Configure the Docker file.

![Next, we configure the docker file](./images/ECR_4.png)

3.  Run the command `docker build -t social-media-backend .` to build. Packaging is successful.

![And run the command docker build -t social-media-backend . to build. Packaging is successful](./images/ECR_5.png)

### 6.1.3. Log in and Push Image to ECR

1.  Log in to ECR using the command line, verify the tag, and check again with `docker image`.

![Log in to ECR using the command line, verify tag, check again with docker image](./images/ECR_6.png)

2.  Run the command to push the image to ECR. Push is complete.

![Then run the command to push the image to ecr. Push completion](./images/ECR_7.png)

---

## 6.2. Create Security Groups

We create 3 Security Groups: 1 for ALB, 1 for ECS/Backend, and 1 for RDS/Database.

### 6.2.1. Security Group for ALB (Internet-Facing)

1.  Select **Create security group**. Set a name, and select the created VPC.
2.  In the **Inbound rules** section, select **HTTP** and **HTTPS** with **Source** as **Anywhere** (`0.0.0.0/0` and `::/0`), click **Create**.

![Set a name, select the created vpc, and in the inbound rules section choose http and https with source as anywhere, click create](./images/SecurityGroup_2.png)

### 6.2.2. Security Group for ECS (Backend)

1.  Set a name, and select the VPC. **Note:** The Dockerfile's Port is **8080**, so the **Inbound rule** will be **Custom TCP** Port **8080**.
2.  The **Source** will be the **Security Group** of the **ALB** just created (only the ALB is allowed to send traffic to ECS).

![Next, we create a security group for ecs, a few things to note are the dockerfile port, in the dockerfile I set the port to 8080 so I will set it to 8080 here, the source must be from the security group ALB we just created](./images/SecurityGroup_3.png)

### 6.2.3. Security Group for RDS (Database)

1.  Set a name, and select the VPC. **Note:** The **Inbound rule** will be **MySQL Port** (3306).
2.  The **Source** will be the **Security Group** of the **ECS** just created (only ECS is allowed to access RDS).

![Continuing to the security group for ecs, in ecs we choose the mysql port and the source is the security group ecs we just created](./images/SecurityGroup_4.png)

3.  In summary, we have 3 Security Groups.

![In summary, we have 3 security groups](./images/SecurityGroup_5.png)
![In summary, we have 3 security groups](./images/SecurityGroup_6.png)

---

## 6.3. Create Target Group and ALB

### 6.3.1. Create Target Group

1.  Go to **EC2** -> **Target Group**, select **Create target group**.

![Go to EC2 -> Target Group select create target group](./images/TargetGroup_1.png)

2.  Select **Type** as **IP address**.

![We select the type as IP address](./images/TargetGroup_2.png)

3.  Set the group name, **Port** as **8080** (configured in the Dockerfile), and select the created VPC.

![Set the group name, port as 8080 configured in the docker file and select the created vpc](./images/TargetGroup_3.png)

4.  In the **Healthy threshold** section, select **2**, leave the rest as default, and click **Create**.

![In the healthy threshold section we select 2, leave the rest as default and click create](./images/TargetGroup_4.png)

5.  Target Group creation is complete.

![Click next on the next page and select create, showing successful creation](./images/TargetGroup_5.png)

### 6.3.2. Create Application Load Balancer (ALB)

1.  In **EC2**, switch to **Load Balancers**, click **Create Load Balancer**. Select **Application Load Balancer**.

![Also in EC2 we go to create Load Balancers, we click create. We select the Application Load Balancer type](./images/ALB_2.png)

2.  Set a name, select **Scheme** as **internet-facing**, **IP address type** as **Ipv4**.

![Set a name, select scheme as internet-facing, select ip address type as Ipv4](./images/ALB_3.png)

3.  In **Network mapping**, select 2 AZs and 2 corresponding **Public Subnets**.

![In Network mapping, we select 2 azs and select 2 corresponding public subnets](./images/ALB_4.png)

4.  In **Security group**, select the Security Group created for the ALB.

![In the security group we select the security we created for the alb](./images/ALB_5.png)

5.  In **Listeners**, we create 2 Listeners:
    - **Listener 1 (HTTP 80)**: Configure to redirect to HTTPS.

![Listener 1 we configure it as shown for http type](./images/ALB_6.png)

    * **Listener 2 (HTTPS 443)**: In **Routing action**, select **Forward to target group**, choose the Target Group just created.

![Listener 2, in routing action we select forward to target group, choose the target group we just created](./images/ALB_7.png)

6.  In the secure configuration section for the Listener (HTTPS), select the **Certification** created in the Route 53 section (ACM).

![In the secure configuration section for the listener we select the Certification created in the route 53 section](./images/ALB_8.png)

7.  Click **Create**. The screen shows successful creation.

![Then click create, the screen shows successful creation](./images/ALB_9.png)

---

## 6.4. Create ECS Cluster and Service

### 6.4.1. Create ECS Cluster

1.  Go to the **ECS** service, **Clusters** tab, click **Create Cluster**.

![Go to the ECS service, Cluster tab, click create cluster](./images/ECScluster_1.png)

2.  Set a name and choose the architecture as **Fargate only**.

![We set a name and choose the architecture, here the architecture will use Fargate only](./images/ECScluster_2.png)

3.  Click **Create**. Creation is successful.

![ECScluster_3.png](./images/ECScluster_3.png)

### 6.4.2. Configure Task Definition

1.  Go to the **Task definitions** tab, click **Create new task definition**.

![Also in the ECS service, we go to the Task definitions tab, click create task](./images/ECScluster_4.png)

2.  Choose to create using a **JSON file** (top right corner of the screen).

![We will choose to create using a json file in the top right corner of the screen](./images/ECScluster_5.png)

3.  Use the JSON file structure containing information such as: ECR image, corresponding port, environment variables (database connection), and CORS (allowing the purchased domain address).

![With the json file structure as follows, sequentially being the ecr image, corresponding port, environment variables, database connection variables, and CORS allowing the purchased domain address, click create](./images/ECScluster_6.png)
![With the json file structure as follows, sequentially being the ecr image, corresponding port, environment variables, database connection variables, and CORS allowing the purchased domain address, click create](./images/ECScluster_7.png)

4.  Click **Create**. Creation is successful.

![Creation is successful](./images/ECScluster_8.png)

### 6.4.3. Create ECS Service

1.  Go to the Cluster just created, scroll down to the **Services** tab, and select **Create Service**.

![Go to the cluster select the newly created cluster](./images/ECSService_1.png)
![Scroll down to the service tab select create service](./images/ECSService_2.png)

2.  In **Service detail**, select the newly created **Task**, set the **Service name**.

![In the Service detail section select the newly created task, set the service name](./images/ECSService_3.png)

3.  In **Environment**, select **Launch type** (Fargate).

![In environment select the Launch type and leave other sections as default](./images/ECSService_4.png)

4.  In **Deployment configuration**, leave as default.

![In the deployment configuration section we leave as default](./images/ECSService_5.png)

5.  In **Networking**, select the created VPC, the 2 **Private Subnets** corresponding to ECS, and disable the **Public IP** function.

![In the networking section, we select the vpc we created, 2 private subnets corresponding to ecs and rds, disable the public IP function](./images/ECSService_6.png)

6.  In the **Load balancing** section, check **Use load balancing**.
    - Use the existing **ALB** and the **Listener** created earlier.

![In the Load balancing section we tick the use load balancing button. Use the existing ALB , and use the listener created previously](./images/ECSService_7.png)
![Use the existing ALB , and use the listener created previously](./images/ECSService_8.png)

7.  Select the existing **Target Group** and choose the Target Group we created in the previous step.

![Finally select the existing target group and choose the target group we did in the previous step](./images/ECSService_9.png)

8.  Finally, click **Create**. The Task has run successfully.

![Finally click create, the task has run successfully](./images/ECSService_10.png)

### 6.4.4. Configure Route 53 Record pointing to ALB

1.  Create a Route 53 record, configured to point to the created **ALB**. The **Name** is `api` (e.g., `api.social-sgu-media.click`), and click **Create**.

![After that, we create a route 53 record, configure it to go through the created ALB, name is api, and click create](./images/ECSService_11.png)

2.  Creation is successful.

![Creation is successful](./images/ECSService_12.png)

## 6.5. Result

Test the configured API URL (e.g., `https://api.social-sgu-media.click/`).

![So we have finished, we test run with the url https://api.social-sgu-media.click/](./images/ECSService_13.png)

Success! Thus, we have completed the Workshop for deploying the Social Media application on AWS.
