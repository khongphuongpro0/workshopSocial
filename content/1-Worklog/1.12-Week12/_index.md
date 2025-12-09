---
title: "Worklog Week 12"
date: "2024-01-15"
weight: 2
chapter: false
pre: " <b> 1.12 </b> "
---

### Week 12 Goals:

- **Frontend Finalization:** Build and integrate completed backend features into the **ReactJS** interface.
- **Cloud Deployment (AWS):** Apply AWS services to deploy the application, ensuring scalability and performance:
  - Deploy **Frontend** to AWS (S3, CloudFront/Route 53).
  - Deploy **Backend** using containers (Docker, ECR, ECS).
  - Set up managed **Database** (RDS).

---

### Tasks to be Implemented This Week:

| Day       | Task                                                                                                                                                                                                                                                                                                    | Start Date | Completion Date | Reference |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | --------------- | --------- |
| Mon - Tue | **Frontend Integration (ReactJS):** <br> - Connect completed APIs (Service/Controller) (e.g., login, registration, fetching personal info, fetching posts) to the scaffolded **ReactJS** pages. <br> - Build the complete **Home/Feed** interface, displaying posts and **Like/Comment** functionality. | 17/11/2025 | 18/11/2025      |           |
| Wed       | **Database Deployment (AWS RDS):** <br> - Set up the **AWS RDS** service (e.g., PostgreSQL/MySQL) and configure it to replace the local database. <br> - Update the Connection String in the Backend to point to **RDS**.                                                                               |

[Image of AWS RDS database architecture]
| 19/11/2025 | 19/11/2025 | |
| Thu | **Containerization (Docker & ECR):** <br> - Create the **Dockerfile** for the Backend application. <br> - Build the **Docker Image** and push it to **AWS ECR** (Elastic Container Registry) in preparation for deployment.

[Image of Docker containerization workflow]
| 20/11/2025 | 20/11/2025 | |
| Fri | **Backend Deployment (AWS ECS):** <br> - Configure and deploy the **AWS ECS** (Elastic Container Service) to run the Backend Docker Image from ECR. <br> - Set up **Load Balancer** and **Security Group** for ECS.

[Image of AWS ECS deployment architecture]
| 21/11/2025 | 21/11/2025 | |
| Sat - Sun | **Frontend Deployment (S3, CloudFront & Route 53):** <br> - Build the ReactJS application and upload it to **AWS S3** (Web Hosting). <br> - Set up **AWS CloudFront** (CDN) to distribute static content and improve access speed. <br> - Configure **AWS Route 53** to point the domain name to CloudFront. | 22/11/2025 | 23/11/2025 | |

---

### Week 12 Achieved Results:

- **Completed Frontend:** Successfully integrated basic **CRUD** and interactive features (Like, Comment, Chat) into the **ReactJS/Bootstrap** interface.
- **Containerized Backend:** The Backend application is packaged with **Docker** and ready for deployment in a container environment.
- **AWS Deployment:**
  - Database has been migrated to **AWS RDS**.
  - Backend has been deployed to **AWS ECS**.
  - Frontend has been deployed to **AWS S3/CloudFront** and configured with **Route 53**.
