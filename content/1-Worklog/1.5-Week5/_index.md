---
title: "Week 5 Worklog"
date: "2024-01-15"
weight: 1
chapter: false
pre: " <b> 1.5. </b> "
---

### Week 5 Objectives:

- Design code architecture.
- Create Layers and basic classes for project deployment.
- Learn more about AWS services, deepen understanding of RDS, Auto Scaling Group, and Amazon Load Balancer.

### Tasks to be carried out this week:

| Day   | Tasks                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Start Date | End Date   | Resources                                           |
| ----- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- | ---------- | --------------------------------------------------- |
| 2     | - Continue learning more about RDS, EC2, Security Group, Auto Scaling Group, Amazon Load Balancer <br> **Practice:** <br> + Practice creating RDS and linking it with EC2 to create a basic test database                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 09/29/2025 | 09/29/2025 | <https://000005.awsstudygroup.com/vi/4-create-rds/> |
| 3 - 6 | - Implement Onion architecture<br> - Design Layers<br> - Design classes such as Service, Repository, IRepository <br> **Practice:**<br> + Use AI to speed up the design of IBaseRepository and BaseRepository classes for common data retrieval code from the database<br> + Create specific code for each Repository with unique features for all remaining Repository classes corresponding to tables such as Account, Address, BlockedUser, Comment, CommentLike, CommentMember, ConversationNickName, Conversation, District, Follow, Friend, User, UserToken, MessageAttachment, MessageReaction, MessageRead.<br> + Design DTOs to return data for the Repositories | 09/30/2025 | 10/05/2025 | DeepSeek, Claude Code                               |

### Week 5 Achievements:

- Gained deeper understanding of EC2, RDS, ASG, and ALB.
- Designed Onion architecture for the project.
- Successfully designed specific classes for database access: IRepository, Repository.
