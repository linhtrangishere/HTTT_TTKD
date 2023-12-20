# Tên Dự Án

Dự Án Quản lý Dữ liệu và Thống kê Bán hàng

## Mô Tả Dự Án

Dự án này tập trung vào quản lý và phân tích dữ liệu bán hàng, sử dụng các kỹ thuật chuẩn hóa, tổng hợp, và xây dựng các cube để hỗ trợ các yêu cầu OLAP và report. Dự án cũng bao gồm việc chuyển đổi dữ liệu ngày tháng để tạo Dimension với phân cấp chiều năm > tháng > ngày > giờ.

## Thành Viên Nhóm

- 20127653 - Trần Nguyễn Lan Trinh
- 20127132 - Nguyễn Văn Đạt
- 20127256 - Trần Anh Ngọc
- 20127317 - Phạm Minh Tài

## Cấu Trúc Dự Án

1. **Mô tả Dữ Liệu:**
   - Mô tả ý nghĩa của các thuộc tính trong tập dữ liệu.
   - Thiết kế Kho Dữ Liệu (KDL), chuẩn hóa, tổng hợp, và nạp dữ liệu từ các nguồn khác nhau.
   - Thiết kế và xây dựng cube.

2. **Chuyển Đổi Dữ Liệu:**
   - Chuyển đổi dữ liệu ngày tháng để tạo Dimension với phân cấp chiều: năm > tháng > ngày > giờ.
   - Thiết kế và xây dựng các phân cấp chiều khác để đáp ứng yêu cầu OLAP và report.

3. **Thiết Kế Dữ Liệu:**
   - Thiết kế NDS (Normalized Data Schema).
   - Thiết kế DDS (Denormalized Data Schema).

4. **Khai Thác Dữ Liệu:**
   - Sử dụng Power BI để thực hiện các báo cáo:
     1. Thống kê số thành viên mua hàng theo ngày, tháng, năm.
     2. Thống kê doanh thu của khách hàng (member, normal) theo ngày, tháng, năm và theo chi nhánh.
     3. Thống kê số lượng khách thanh toán theo cash/debit/… ở từng chi nhánh theo từng tháng trong năm.
     4. Thống kê lượng rating của khách hàng (member, normal) theo từng loại sản phẩm (ProductLine).
     5. Thống kê số lượng sản phẩm bán được theo từng thời điểm (time/date).
     6. Thống kê số lượng khách hàng nữ đã mua theo từng loại sản phẩm.

5. **OLAP:**
   - Phân tích tình hình mua hàng của khách hàng theo từng chi nhánh, từng loại sản phẩm, theo thời gian, và hình thức thanh toán.

6. **Mining:**
   - Dự đoán kết quả mua hàng của khách hàng theo từng loại sản phẩm.

7. **Tự Đề Xuất:**
   - Sinh viên có thể tự đề xuất một trường hợp hoặc nâng cấp cho dự án.

8. **Kết Luận Chung:**
   - Tóm tắt các kết quả, khám phá và đánh giá kết quả của dự án.

## Đóng Góp

Nếu bạn muốn đóng góp vào dự án, hãy tạo Pull Request và chúng tôi sẽ xem xét.

## Bản Quyền

Dự án này được phân phối dưới [giấy phép MIT](LICENSE).

---
**Happy Coding!**
