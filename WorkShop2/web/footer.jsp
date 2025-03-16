<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .footer {
        background-color: #2c3e50;
        color: #fff;
        padding: 3rem 0;
        margin-top: 2rem;
    }

    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 2rem;
    }

    .footer-section h3 {
        font-size: 1.2rem;
        margin-bottom: 1rem;
        color: #3498db;
    }

    .footer-section p {
        margin-bottom: 0.5rem;
        font-size: 0.9rem;
        line-height: 1.5;
    }

    .footer-links {
        list-style: none;
    }

    .footer-links li {
        margin-bottom: 0.5rem;
    }

    .footer-links a {
        color: #fff;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-links a:hover {
        color: #3498db;
    }

    .copyright {
        text-align: center;
        padding-top: 2rem;
        margin-top: 2rem;
        border-top: 1px solid #34495e;
        font-size: 0.9rem;
    }
</style>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3>Giới thiệu</h3>
            <p>Hệ thống thi trực tuyến giúp sinh viên làm bài thi, xem kết quả nhanh chóng và giúp giảng viên quản lý đề thi.</p>
        </div>

        <div class="footer-section">
            <h3>Liên kết nhanh</h3>
            <ul class="footer-links">
                <li><a href="dashboard.jsp">Trang chủ</a></li>
                <li><a href="examCategories.jsp">Danh mục kỳ thi</a></li>
                <li><a href="takeExam.jsp">Làm bài thi</a></li>
                <li><a href="contact.jsp">Liên hệ</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Liên hệ</h3>
            <p>Email: support@examonline.com</p>
            <p>Điện thoại: 0123-456-789</p>
            <p>Địa chỉ: 456 Đường XYZ, TP. Hồ Chí Minh</p>
        </div>
    </div>

    <div class="copyright">
        <p>&copy; 2024 Exam System. Tất cả quyền được bảo lưu.</p>
    </div>
</footer>
