---
title: "Blog 3. Xây dựng ứng dụng SAP nhanh chóng với Amazon Q Developer"
date: "2025-07-01"
weight: 1
chapter: false
pre: " <b> 3.3. </b> "
categories: ["Amazon Q", "Amazon Q Developer", "Announcements", "SAP on AWS"]
authors: ["Gyan Mishra", "Beth Sharp", "Erik Kamman", "Padaval Harshavardhan"]
---

## Giới thiệu

Tất cả các công ty đều đang tìm kiếm những cách giúp các nhà phát triển của họ tăng năng suất, xây dựng ứng dụng nhanh hơn và đơn giản hóa gánh nặng trong việc duy trì mã cũ. **Amazon Q Developer** là một công cụ AI sinh mã (generative AI tool) có thể giúp các công ty loại bỏ gánh nặng kỹ thuật gắn liền với môi trường SAP được tùy chỉnh quá mức của họ, đồng thời triển khai các tính năng mới nhanh hơn. Trong bài viết này, chúng ta sẽ cùng tìm hiểu cách bạn có thể sử dụng Amazon Q Developer để giúp các nhà phát triển SAP của mình cải thiện năng suất và đổi mới nhanh hơn.

SAP là một ứng dụng có tính chất quan trọng trong việc vận hành các hoạt động kinh doanh cho hàng nghìn công ty trên toàn cầu. Trong suốt nhiều năm, rất nhiều khách hàng đã tùy chỉnh SAP để đáp ứng các yêu cầu riêng biệt của doanh nghiệp mình bằng ngôn ngữ lập trình **ABAP**.

Mặc dù các chương trình ABAP này đã giúp các công ty điều chỉnh SAP, nhưng điều đó cũng khiến môi trường SAP trở nên cực kỳ phức tạp, khó vận hành và nâng cấp. Hiện nay, khi các công ty muốn chuyển lên cloud, triển khai các giải pháp mới nhất của SAP như S/4HANA, và áp dụng chiến lược **“clean core”**, thì các đoạn mã kế thừa này trở thành một thách thức lớn.

---

## Đơn giản hóa việc hiện đại hóa SAP với Amazon Q Developer

Amazon Q Developer có thể giúp các công ty vượt qua những thách thức của các đoạn mã cũ, cho phép nâng cấp SAP nhanh hơn, tiết kiệm hơn. Điều này cũng giúp đơn giản hóa việc tuân thủ quy định, vá bảo mật, và tận dụng những tính năng phần mềm mới. Amazon Q Developer có khả năng tự động tạo tài liệu, cả về đặc tả chức năng lẫn kỹ thuật cho mã ABAP kế thừa, giúp tiết kiệm hàng giờ làm việc quý báu.

Amazon Q Developer hoạt động trên toàn bộ hệ sinh thái khung lập trình của SAP, bao gồm **classical SAP ABAP, SAP ABAP RESTful Application Programming Model (RAP)**, và **SAP Cloud Application Programming Model (CAP)**. Q Developer có sẵn dưới dạng tiện ích mở rộng IDE trong VS Code, Eclipse, và nhiều công cụ khác.

Các khách hàng sử dụng Q Developer cho các ngôn ngữ lập trình khác đã báo cáo mức tăng năng suất của lập trình viên lên đến **40%**, và tốc độ phát triển nhanh hơn đến **80%** trong nhiều tác vụ khác nhau.

> **Saul Dave, Giám đốc cấp cao mảng hệ thống doanh nghiệp tại Zappos.com**, đã chia sẻ rằng: **Amazon Q Developer sẽ là một bước ngoặt lớn cho nhóm phát triển và hỗ trợ ứng dụng ABAP của chúng tôi.**

Giờ đây, chúng ta sẽ cùng đi sâu vào bốn ví dụ cụ thể để thấy cách Q Developer có thể cải thiện năng suất cho các lập trình viên SAP:

1.  Tạo mã ABAP
2.  Tạo ứng dụng BTP và Fiori
3.  Tạo test case
4.  Viết tài liệu cho mã ABAP kế thừa

---

### Tạo mã ABAP

Amazon Q Developer có thể hiểu các prompt ngôn ngữ tự nhiên để tạo ra mã có chức năng đầy đủ. Trong ví dụ này, mã ABAP được sinh ra để hiển thị danh sách các đơn hàng bán mở, có khả năng lọc theo số đơn hàng hoặc mã khách hàng.

Lập trình viên chỉ cần nhập prompt sau vào Q Developer:

> “Generate an ABAP report named zhprp_sales zhprp_sales_order_overview, showing list of open sales orders, filter either by order number or customer number (sold-to-party). Include: Sales order number, Sold-to-party, Order Creation date, Line Item number, Material Number, Ordered quantity, Confirmed Quantity. Order the records by sales order number. Display the output in ALV format.”

### Tạo mã cho Fiori và BTP

Ví dụ tiếp theo minh họa cách phát triển một ứng dụng Fiori hoàn chỉnh bằng Q Developer. Ví dụ này sử dụng một prompt duy nhất để hướng dẫn từng bước tạo ra cả phần front-end và back-end. Prompt được sử dụng như sau:

> “Provide me with all the things I need to do to create a fiori application for the sales order(create, update, delete) and then you can handhold me while I am creating each step. In addition to that I want to have a class to insert dummy data and test classes for my cds view for TDD.”

Amazon Q áp dụng phương pháp phát triển theo tầng:

- **Tầng Cơ sở dữ liệu:** Tạo ra các cấu trúc bảng cần thiết.
- **Tầng CDS:** Thiết lập root CDS view để trừu tượng hóa các bảng cơ sở dữ liệu.
- **Tầng Nghiệp vụ:** Tạo định nghĩa hành vi cho CDS view, bao gồm các lớp triển khai hành vi và lớp kiểm tra.
- **Tầng Dịch vụ:** Tạo định nghĩa service và ràng buộc cho OData V2.
- **Tầng UI:** Hỗ trợ UI annotations và tạo custom controller actions cùng HTML UI5 components để hoàn thiện ứng dụng Fiori.

### Tạo các trường hợp kiểm thử

Amazon Q Developer giúp tạo các lớp kiểm thử cho mã nguồn hiện có khi tài liệu hoặc lập trình viên ban đầu không còn sẵn. Người dùng chỉ cần dán đoạn mã của họ vào cửa sổ chat nội tuyến của Q, hệ thống sẽ phân tích và tự động tạo ra các kịch bản kiểm thử toàn diện.

> “Generate unit test class for public methods “Provide your class logic/details here”

Tính năng này cho phép các lập trình viên dễ dàng kiểm thử logic nghiệp vụ ngay cả sau nhiều lần chỉnh sửa, giúp tiết kiệm đáng kể công sức cho việc kiểm thử thủ công.

### Tài liệu hóa mã ABAP cũ

Ví dụ sau đây minh họa cách Amazon Q Developer phân tích mã ABAP và tự động tạo tài liệu kỹ thuật dựa trên các mẫu tùy chỉnh của bạn. Amazon Q Developer đơn giản hóa quy trình tài liệu hóa bằng cách trích xuất các thông tin chính và duy trì tiêu chuẩn định dạng nhất quán. Đoạn prompt được sử dụng như sau:

> “Generate a technical documentation of the above ABAP code. Make sure to provide highly detailed documentation, clearly explaining the action performed each of the components using following pointers as template:
>
> 1. Class/Program name
> 2. Class/Program Overview
> 3. Technical Specifications (3.1 Data Structure, 3.2 Selection Screen)
> 4. Main Components (4.1 Subroutines/Methods)
> 5. Test Implementation (5.1 Test Methods, 5.2 Test Setup)
> 6. Technical Dependencies
> 7. Error Handling
> 8. Performance Considerations”

Tính năng này cho phép các tổ chức dễ dàng hiểu và ghi lại các quy trình nghiệp vụ bị ảnh hưởng, giúp ích trong quá trình di chuyển và chuyển giao kiến thức.

---

## Mô hình định giá

- **Amazon Q Developer Free Tier:** Cung cấp 50 lượt tương tác chat mỗi tháng, hỗ trợ phát triển phần mềm 5 lần mỗi tháng, và chuyển đổi tối đa 1.000 dòng mã mỗi tháng.
- **Pro Tier:** Bao gồm tất cả tính năng trong gói miễn phí, đồng thời bổ sung các tính năng kiểm soát truy cập ở cấp độ doanh nghiệp, khả năng tùy chỉnh Q Developer phù hợp với cơ sở mã của bạn, và giới hạn sử dụng cao hơn cho các tính năng nâng cao.

Hiện đại hóa mã SAP cũ của bạn ngay hôm nay. Truy cập [Workshop] này để xem hướng dẫn từng bước về cách thiết lập Amazon Q Developer. Để tìm hiểu thêm, hãy xem [tài liệu] của chúng tôi hoặc liên hệ với đội ngũ của chúng tôi.
