---
title: "Blog 1.Extending SAP Field Service Management with AWS: A Clean Core Approach for Attachment Storage"
date: "2025-07-07"
weight: 1
chapter: false
pre: " <b> 3.1. </b> "
categories: ["SAP on AWS", "Serverless"]
authors: ["Francesco Bersani", "Otto Kruse", "Peter Daukintis"]
---

Digital transformation in field service operations has led to an exponential increase in assets generation and therefore storage requirements. Organizations using **SAP Field Service Management (SAP FSM)** face growing challenges in managing digital assets captured by field service technicians. These assets can consist of equipment pictures, forms, customer signatures and other critical assets managed when in the field. This post demonstrates how to leverage **Amazon Web Services (AWS)** to create a scalable, cost-effective attachment storage solution for SAP FSM while adhering to **SAP Clean Core Extensibility** principle.

---

## Overview

Field service operations generate substantial amounts of attachments throughout their daily activities. While SAP FSM provides native storage capabilities, organizations often require more storage space and a more flexible and cost-effective solutions that allow them to maintain data ownership for compliance reasons while enabling integration with other business processes. By integrating SAP FSM with an organization’s AWS infrastructure, this solution empowers enterprises to maintain control over their data, while also enabling advanced processing and analysis to extract maximum value from the assets created in the field.

The integration proposed in this blog allows organizations to store the attachments generated in SAP FSM in an **Amazon Simple Storage Service (S3) bucket** in one of their own AWS Accounts, enforcing data ownership and reducing the data footprint in SAP FSM. In addition, an organization can implement additional data processing and analysis on the stored attachments by leveraging AWS services such as **Amazon Textract** for text extraction, **Amazon Rekognition** for image analysis, or **Amazon Comprehend** for natural language processing. Having the full control of these assets is also the starting point to power more complex solution by leveraging **Large Language Models (LLMs)** and **Knowledge Base** integrations.

---

## How it works

The process begins in the field, where a service technician completes their work at a customer site. Using their mobile device with the **SAP FSM application**, they capture crucial documents. When they tap “upload” in their FSM application, they set in motion a chain of events designed to ensure the documents are stored, safely accessible within the organization.

![How it works: High-level data flow from SAP FSM to AWS S3](./images/blog1_1.png)

As the attachment lands in SAP FSM, the system’s business rule engine immediately detects this new content. The engine, configured with specific rules for attachment handling, springs into action. The business rule extracts essential information about the attachment (unique identifier, filename, description, timestamp, and relationship to the service call).

The business rule then makes an **HTTPS request** with the attachment’s **metadata** to a dedicated **API endpoint** in the customer’s AWS environment. This API, built on **Amazon API Gateway**, is protected with a unique API key for the SAP FSM tenant, and **IP allowlisted** to the SAP FSM environment.

Upon receiving the metadata, the API publishes it to **Amazon EventBridge (EventBridge)**. The handling of this event happens asynchronously by an **AWS Lambda (Lambda)** function – the attachment processor. This function performs several critical tasks in sequence:

1.  It authenticates with SAP FSM using **OAuth2 credentials** stored in **AWS Secrets Manager**.
2.  It retrieves the actual attachment content using SAP FSM’s attachment API.
3.  It processes this content, enriches it with the original metadata, and stores everything in a designated **S3 bucket**.

Here the detailed architecture diagram:

![Detailed Reference Architecture of SAP FSM and AWS Integration](./images/blog1_2.png)

---

## SAP FSM Extension

The solution allows FSM customers to view operational metrics about the Amazon S3 back-ups of the attachments, and can be installed as an **SAP FSM extension**.

The extension is a web page, built with **React**, and hosted on **Amazon CloudFront** and **Amazon S3**. The extension provides real-time visibility into your S3 storage metrics via a built-in **Amazon CloudWatch** dashboard.

### Extension Authentication

Because the extension runs inside user’s browsers (as an **HTML iframe**), it uses a new authentication pattern:

1.  The extension uses the **SAP FSM SDK** to acquire a **short-lived token (JWT)** for the user, which is cryptographically signed by SAP FSM.
2.  The token is then used to authorize requests from the extension to **AWS API Gateway**.
3.  The solution includes a **Lambda Custom Authorizer** that uses the library `aws-jwt-verify` to verify the token, checking the tenant details and the cryptographic signature.

---

## Getting Started

The high level steps of the implementation includes:

1.  Review the prerequisites and ensure you have the necessary AWS and SAP FSM access.
2.  Deploy the solution using the provided **CloudFormation templates** in your region.
3.  Configure the **OAuth2 credentials** in SAP FSM.
4.  Install and configure the extension in SAP FSM Extension marketplace.
5.  Monitor the implementation through the provided **CloudWatch dashboard**.

---

## Cost Overview

The costs related to deploying and using the solution are mainly related to the volume of attachments created in FSM. For testing purposes, the costs are minimal, less than **$1 per month**.

### Production Cost Assumptions

| Assumption                                                | Value                    | Details    |
| :-------------------------------------------------------- | :----------------------- | :--------- |
| Number of attachments created in SAP FSM (FSM agent)      | 100,000                  | per Month  |
| Volume of attachment (GB)                                 | 100                      | per Month  |
| Number of http requests for Extension UI (FSM admin user) | 10,000                   | per Month  |
| AWS Region                                                | eu-central-1 (Frankfurt) |            |
| Currency                                                  | USD                      | US Dollars |

(Table 1: Assumptions for cost calculation)

### Cost Breakdown

- **Total Monthly Cost:** **6.81 USD**
- **Total Yearly Cost:** **81.72 USD**

| Description                                                      | AWS Service        | Monthly (USD) | Year (USD) |
| :--------------------------------------------------------------- | :----------------- | :------------ | :--------- |
| Distribution                                                     | Amazon CloudFront  | 0.23          | 2.76       |
| S3 Bucket (attachments)                                          | S3 Standard        | 3.04          | 36.48      |
| REST API Gateway                                                 | Amazon API Gateway | 0.37          | 4.44       |
| Metrics                                                          | Amazon CloudWatch  | 3.01          | 36.12      |
| _Other Serverless services (Lambda, EventBridge, Data Transfer)_ | _AWS Serverless_   | _~0.16_       | _~1.92_    |

(Table 2: Cost details summary)

---

## Conclusion

The integration between SAP Field Service Management and AWS demonstrates how organizations can leverage **cloud-native serverless services** to build scalable, secure, and cost-effective solutions while maintaining a **clean core approach**.

### Key Benefits:

- **Reduced data footprint** in SAP FSM.
- **Enhanced data sovereignty and control**.
- **Cost-effective scalable storage** through S3.
- **Built-in monitoring and observability**.
- **Potential for advanced analytics and AI/ML integration**.
- **Seamless user experience** for field technicians.

The solution’s **serverless architecture** ensures minimal operational overhead.

---

## Join the SAP on AWS Discussion

AWS provides public question and answer forums on our **re:Post Site**. Refer to the **AWS Serverless blog section** to learn more about serverless and event driven architecture patterns.
