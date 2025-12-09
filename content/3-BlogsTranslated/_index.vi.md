---
title: "Các bài blogs đã dịch"
date: "2024-01-15"
weight: 3
chapter: false
pre: " <b> 3. </b> "
---

Tại đây là phần liệt kê, giới thiệu các bài blog chuyên sâu mà em đã nghiên cứu và dịch. Các bài viết này tập trung vào các chủ đề **SAP trên AWS**, **Kiến trúc Cloud Hybrid** và **Ứng dụng AI/ML trong phát triển phần mềm**, thể hiện sự tìm hiểu và áp dụng các giải pháp doanh nghiệp quy mô lớn.

###  [Blog 1 - Mở rộng SAP FSM với AWS: Cách tiếp cận Clean Core](3.1-Blog1/)

Blog này giới thiệu một giải pháp **Clean Core Extensibility** (mở rộng lõi sạch) để xử lý dữ liệu SAP Field Service Management (SAP FSM). Bài viết mô tả kiến trúc **Serverless** (sử dụng API Gateway, Lambda, EventBridge và S3) để **lưu trữ tệp đính kèm** của SAP FSM vào **Amazon S3**, giúp giảm dung lượng dữ liệu trong SAP FSM và tăng quyền kiểm soát dữ liệu. Giải pháp này cũng mở ra tiềm năng tích hợp các dịch vụ AI/ML như Amazon Textract và Rekognition để xử lý và phân tích nội dung tệp đính kèm.

###  [Blog 2 - Xây dựng kết nối mạng Hybrid đạt chuẩn cho SAP Cloud ERP Private](3.2-Blog2/)

Blog này trình bày ba tùy chọn kiến trúc mạng chi tiết (Direct Connect, Hybrid DX + VPN Failover, Landing Zone) để thiết lập kết nối an toàn, đáng tin cậy giữa mạng công ty (on-premises) và môi trường **SAP Cloud ERP Private** (trước đây là RISE with SAP) trên AWS. Bài viết phân tích các yếu tố như hiệu năng, chi phí, độ trễ và khả năng chịu lỗi, đồng thời hướng dẫn cách sử dụng các dịch vụ như **AWS Direct Connect, Site-to-Site VPN, và AWS Transit Gateway** để xây dựng nền tảng mạng cấp doanh nghiệp.

###  [Blog 3 - Xây dựng ứng dụng SAP nhanh chóng với Amazon Q Developer](3.3-Blog3/)

Blog này khám phá cách sử dụng **Amazon Q Developer**, một công cụ AI sinh mã (Generative AI), để tăng năng suất cho các nhà phát triển SAP. Bài viết nhấn mạnh thách thức của mã ABAP kế thừa và giải thích cách Q Developer có thể giúp **tạo tài liệu tự động**, đơn giản hóa quá trình **hiện đại hóa SAP** (chuyển đổi sang S/4HANA và chiến lược Clean Core). Công cụ này hỗ trợ toàn bộ hệ sinh thái SAP (ABAP, RAP, CAP) và đã được ghi nhận là giúp tăng năng suất lên đến 40%.
