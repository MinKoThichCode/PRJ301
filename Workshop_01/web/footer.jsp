<%-- 
    Document   : footer
    Created on : Mar 2, 2025, 3:57:28 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .footer {
        background-color: #1a1a2e;
        color: #fff;
        padding: 2rem 0;
        margin-top: 3rem;
        width: 100%;
    }

    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
        
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 2rem;
        text-align: center;
    }

    .footer-section h3 {
        font-size: 1.2rem;
        margin-bottom: 1rem;
        color: #f39c12;
    }

    .footer-section p {
        font-size: 0.9rem;
        line-height: 1.5;
    }

    .footer-links {
        list-style: none;
        padding: 0;
    }

    .footer-links li {
        margin-bottom: 0.5rem;
    }

    .footer-links a {
        color: #f1c40f;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-links a:hover {
        color: #3498db;
    }

    .social-links {
        display: flex;
        justify-content: center;
        gap: 1rem;
        margin-top: 1rem;
    }

    .social-links a {
        color: #fff;
        text-decoration: none;
        font-size: 1.5rem;
    }

    .copyright {
        text-align: center;
        padding-top: 2rem;
        border-top: 1px solid #34495e;
        font-size: 0.9rem;
    }
</style>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3>Về chúng tôi</h3>
            <p>Giải pháp quản lý dự án startup giúp theo dõi tiến độ, tối ưu quy trình làm việc.</p>
        </div>
        
        <div class="footer-section">
            <h3>Liên kết</h3>
            <ul class="footer-links">
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Dự án</a></li>
                <li><a href="#">Tài nguyên</a></li>
                <li><a href="#">Liên hệ</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>Hỗ trợ</h3>
            <p>📍 456 Startup Street, TP HCM</p>
            <p>📧 support@startupmanager.com</p>
            <p>📞 (84) 987-654-321</p>
        </div>
        
        <div class="footer-section">
            <h3>Kết nối</h3>
            <div class="social-links">
                <a href="#">🌍</a>
                <a href="#">💼</a>
                <a href="#">📊</a>
            </div>
        </div>
    </div>
    
    <div class="copyright">
        <p>&copy; 2025 Startup Project Management. Tất cả quyền được bảo lưu.</p>
    </div>
</footer>
