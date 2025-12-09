---
title: "Blog 3. Build SAP applications faster with Amazon Q Developer"
date: "2025-07-01"
weight: 1
chapter: false
pre: " <b> 3.3. </b> "
categories: ["Amazon Q", "Amazon Q Developer", "Announcements", "SAP on AWS"]
authors: ["Gyan Mishra", "Beth Sharp", "Erik Kamman", "Padaval Harshavardhan"]
---

## Introduction

All companies are looking for ways to help their developers improve productivity, build applications faster, and simplify the burden of maintaining legacy code. **Amazon Q Developer** is a generative AI tool that can help companies eliminate the technical debt associated with their highly customized SAP environments and deliver new features faster. In this blog, we will discuss how you can use Amazon Q Developer to help your SAP developers improve productivity and innovate faster.

SAP is a mission critical application that powers business operations for thousands of companies globally. Over the years (and decades), many customers have customized SAP to meet their company’s unique requirements. To create these customizations, customers have utilized SAP’s **ABAP** programming language to write purpose-built programs that deliver required business functionality.

While ABAP programs have helped companies make SAP work for their business, this has led to highly customized SAP environments that are difficult to operate and upgrade. We commonly hear about complex ABAP code written “decades ago” that lacks documentation or the original developers have retired. Now, as these companies look to migrate to the cloud, implement SAP’s latest offerings including S/4HANA, and adopt SAP’s recommended **“clean core” strategy**, legacy code presents many challenges.

---

## Simplifying SAP modernization with Amazon Q Developer

Amazon Q Developer can help companies overcome the challenges of legacy code, enabling faster, lower cost SAP upgrades. This, in turn, simplifies regulatory compliance, security patching, and benefitting from new software capabilities. Amazon Q Developer is capable of generating documentation, both functional and technical specifications, for legacy ABAP code, saving hours of valuable time.

Amazon Q Developer works across the entire SAP suite of programming frameworks, including classical **SAP ABAP, SAP ABAP RESTful Application Programming Model (RAP)**, and **SAP Cloud Application Programming Model (CAP)**. Q Developer is available as an IDE extension within VS Code, Eclipse, and several more. The Eclipse version of Amazon Q developer will be fully functional for all the different ABAP object types in the near future.

Customers using Q Developer with other programming languages (Java, Python) have reported up to 40% increase in developer productivity and up to 80% acceleration in various development tasks. We are already starting to hear from SAP customers (and partners) who are realizing similar benefits for ABAP development.

> Saul Dave, Senior Director of Enterprise Systems, at Zappos.com stated that **Amazon Q Developer will be a game-changer for our ABAP development and application support teams.**

Now, we will dive into four example use cases to show how Q Developer can improve productivity for SAP developers:

1.  Generating ABAP code
2.  Generating BTP and Fiori applications
3.  Generating test cases
4.  Documenting legacy ABAP code

---

### Generating ABAP Code

Amazon Q Developer can interpret natural language prompts to create functional code. In this example, ABAP code is generated to display open sales orders, which includes capability to filter on order number and customer number. The developer creates the code by entering the following prompt in Q Developer:

> “Generate an ABAP report named zhprp_sales_order_overview, showing list of open sales orders, filter either by order number or customer number (sold-to-party). Include: Sales order number, Sold-to-party, Order Creation date, Line Item number, Material Number, Ordered quantity, Confirmed Quantity. Order the records by sales order number. Display the output in ALV format.”

### Code Generation for Fiori and BTP

The next example shows how to develop an entire Fiori application using Q Developer. This example uses a single prompt that steps through the process to create the front end and back end components, including a CDS view, an OData interface, and a UI. The prompt used is as follows:

> “Provide me with all the things I need to do to create a fiori application for the sales order(create, update, delete) and then you can handhold me while I am creating each step. In addition to that I want to have a class to insert dummy data and test classes for my cds view for TDD.”

Amazon Q follows a layered approach:

- **Database layer:** Where necessary table structures are created.
- **CDS layer:** Where a root CDS view is established to provide a business-oriented view of the data.
- **Business layer:** Amazon Q helps generate the behavior definition of the CDS view, including behavior implementation and test classes.
- **Service layer:** Involves creating service definition and binding for OData V2 exposure.
- **UI layer:** Amazon Q assists with UI annotations using metadata extension.

The final steps involve creating custom controller actions and HTML UI5 components to generate the complete Fiori application.

### Unit Test Case Generation

Amazon Q developer helps create test classes for existing code when documentation and original developers are unavailable. Users simply paste their code into Q’s inline chat, which then analyzes and generates comprehensive test scenarios automatically. Any syntax errors in generated code can be quickly fixed through Q’s inline chat feature with one-click implementation. The generated test class is immediately available in the SAP system and can be fine-tuned as needed.

> “Generate unit test class for public methods ”Provide the your class logic/details here”

This feature allows developers to test the business logic easily even after multiple iterations, saving a huge amount of effort on manual testing.

### Documenting legacy ABAP code:

The following example showcases how Amazon Q Developer analyzes ABAP code and automatically generates documentation, adapting to both existing codebases and newly created code based on your custom templates in the chat window. You can easily convert the documentation to PDF or Word documents. Amazon Q Developer streamlines the documentation process by extracting key information and maintaining consistent formatting standards. For this example, the following prompt was used:

> “Generate a technical documentation of the above ABAP code. Make sure to provide highly detailed documentation, clearly explaining the action performed each of the components using following pointers as template:
>
> 1. Class/Program name
> 2. Class/Program Overview
> 3. Technical Specifications
>    3.1 Data Structure
>    3.2 Selection Screen (If provided)
> 4. Main Components
>    4.1 Subroutines/Methods
> 5. Test Implementation (If provided)
>    5.1 Test Methods
>    5.2 Test Setup
> 6. Technical Dependencies
> 7. Error Handling
> 8. Performance Considerations”

This feature allows organizations to easily understand and document the business processes impacted by relevant custom objects, helping them during migration and knowledge transfer.

As you can see from the examples above, Amazon Q Developer offers powerful capabilities to reduce manual work for SAP developers, helping customer more rapidly modernize their business processes. We are excited to see how customers will continue to take advantage of these capabilities.

---

## Pricing Models:

You can get started on the **Amazon Q Developer Free Tier**, which offers 50 chat interactions per month, software development assistance 5 times per month, and transformation of up to 1,000 lines of code per month. The **Pro Tier** offers all features in the free tier, plus enterprise access control features to manage users and policies, ability to customize Q Developer to your code base to improve suggestions, and higher usage limits for advanced features. Click here to explore our detailed pricing plans.

Modernize your legacy SAP code today. Access this [Workshop] for step-by-step instructions on setting up Amazon Q Developer. Watch for upcoming YouTube videos that demonstrate SAP use cases and provide deep dives into these and other scenarios. To learn more about Amazon Q Developer, view our [documentation] or reach out to our teams to discuss how we can help modernize your legacy SAP code.
