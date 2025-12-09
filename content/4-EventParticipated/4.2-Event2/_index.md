---
title: "Event 2"
date: "2024-01-15"
weight: 1
chapter: false
pre: " <b> 4.2. </b> "
---

# Workshop Report "GenAI-powered App-DB Modernization workshop"

### Event Objectives

- Share best practices in modern application design
- Introduce DDD methodology and event-driven architecture
- Guide the selection of appropriate compute services
- Introduce AI tools supporting the development lifecycle

### Speakers List

- **Jignesh Shah** - Director, Open Source Databases
- **Erica Liu** - Sr. GTM Specialist, AppMod
- **Fabrianne Effendi** - Assc. Specialist SA, Serverless Amazon Web Services

### Key Content Highlights

#### Addressing the Negative Impacts of Legacy Application Architecture

- Slow product release time → Revenue loss/missed opportunities
- Inefficient operation → Lost productivity, increased costs
- Non-compliance with security regulations → Security breach, damaged reputation

#### Transitioning to a New Application Architecture - Microservice Architecture

Transitioning to a modular system – where each function is an **independent service** communicating via **events** with 3 core pillars:

- **Queue Management**: Handling asynchronous tasks
- **Caching Strategy:** Optimizing performance
- **Message Handling:** Flexible communication between services

#### Domain-Driven Design (DDD)

- **4-step method**: Identify domain events → arrange timeline → identify actors → define bounded contexts
- **Bookstore case study**: Illustrating practical application of DDD
- **Context mapping**: 7 patterns for integrating bounded contexts

#### Event-Driven Architecture

- **3 integration patterns**: Publish/Subscribe, Point-to-point, Streaming
- **Benefits**: Loose coupling, scalability, resilience
- **Sync vs Async comparison**: Understanding the trade-offs

#### Compute Evolution

- **Shared Responsibility Model**: From EC2 → ECS → Fargate → Lambda
- **Serverless benefits**: No server management, auto-scaling, pay-for-value
- **Functions vs Containers**: Criteria for appropriate selection

#### Amazon Q Developer

- **SDLC automation**: From planning to maintenance
- **Code transformation**: Java upgrade, .NET modernization
- **AWS Transform agents**: VMware, Mainframe, .NET migration

### Key Learnings

#### Design Mindset

- **Business-first approach**: Always start with the business domain, not technology
- **Ubiquitous language**: Importance of common vocabulary between business and tech teams
- **Bounded contexts**: How to identify and manage complexity in large systems

#### Technical Architecture

- **Event storming technique**: Practical method for modeling business processes
- Using **Event-driven communication** instead of synchronous calls
- **Integration patterns**: Understanding when to use sync, async, pub/sub, streaming
- **Compute spectrum**: Criteria for choosing from VM → containers → serverless

#### Modernization Strategy

- **Phased approach**: No rushing, a clear roadmap is necessary
- **7Rs framework**: Various paths depending on the characteristics of each application
- **ROI measurement**: Cost reduction + business agility

### Application to Work

- **Applying DDD** to the current project: Event storming sessions with the business team
- **Refactor microservices**: Using bounded contexts to identify service boundaries
- **Implement event-driven patterns**: Replacing some synchronous calls with async messaging
- **Serverless adoption**: Piloting AWS Lambda for suitable use cases
- **Try Amazon Q Developer**: Integrate into the development workflow to boost productivity

### Event Experience

Participating in the **"GenAI-powered App-DB Modernization"** workshop was a highly valuable experience, giving me a comprehensive view of how to modernize applications and databases using modern methods and tools. Some notable experiences:

#### Learning from Highly Qualified Speakers

- Speakers from AWS and major technology organizations shared **best practices** in modern application design.
- Through practical case studies, I gained a clearer understanding of how to apply **Domain-Driven Design (DDD)** and **Event-Driven Architecture** to large projects.

#### Practical Technical Experience

- Participating in **event storming** sessions helped me visualize how to **model business processes** into domain events.
- Learned how to **decompose microservices** and define **bounded contexts** to manage system complexity.
- Understood the trade-offs between **synchronous and asynchronous communication** as well as integration patterns like **pub/sub, point-to-point, streaming**.

#### Applying Modern Tools

- Directly learned about **Amazon Q Developer**, an AI tool supporting the SDLC from planning to maintenance.
- Learned how to **automate code transformation** and pilot serverless with **AWS Lambda**, thereby enhancing development productivity.

#### Connection and Exchange

- The workshop provided opportunities for direct exchange with experts, colleagues, and the business team, helping to **elevate the ubiquitous language** between business and tech.
- Through practical examples, I realized the importance of the **business-first approach**, always starting with business needs rather than solely focusing on technology.

#### Lessons Learned

- Applying DDD and event-driven patterns helps reduce **coupling**, and increase **scalability** and **resilience** for the system.
- The modernization strategy requires a **phased approach** and **ROI measurement**; one should not rush to convert the entire system.
- AI tools like Amazon Q Developer can **boost productivity** when integrated into the existing development workflow.

> Overall, the event not only provided technical knowledge but also helped me change my mindset regarding application design, system modernization, and effective collaboration between teams.
