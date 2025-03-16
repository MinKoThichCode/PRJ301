<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .header {
        background-color: #2c3e50;
        padding: 1rem 0;
        width: 100%;
        top: 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
    }

    .nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        color: #fff;
        font-size: 1.5rem;
        font-weight: bold;
        text-decoration: none;
    }

    .menu {
        display: flex;
        list-style: none;
        gap: 2rem;
    }

    .menu-item a {
        color: #fff;
        text-decoration: none;
        font-size: 1rem;
        transition: color 0.3s ease;
    }

    .menu-item a:hover {
        color: #3498db;
    }

    .user-section {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .welcome-text {
        color: #fff;
        font-size: 0.95rem;
    }

    .user-name {
        color: #3498db;
        font-weight: bold;
    }

    .logout-btn {
        background-color: #e74c3c;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 0.4rem 0.8rem;
        font-size: 0.85rem;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .logout-btn:hover {
        background-color: #c0392b;
    }
</style>

<header class="header">
    <div class="container">
        <nav class="nav">
            <a href="dashboard.jsp" class="logo">Exam System</a>
            <ul class="menu">
                <li class="menu-item"><a href="dashboard.jsp">Trang chủ</a></li>
                <li class="menu-item"><a href="examCategories.jsp">Danh mục kỳ thi</a></li>
                <li class="menu-item"><a href="takeExam.jsp">Làm bài thi</a></li>
            </ul>
            <div class="user-section">
                <c:if test="${not empty sessionScope.user}">
                    <span class="welcome-text">Xin chào, <span class="user-name">${sessionScope.user.name}</span>!</span>

                    <form action="MainController" method="post" style="margin: 0;">
                        <input type="hidden" name="action" value="logout"/>
                        <input type="submit" value="Đăng xuất" class="logout-btn"/>
                    </form>
                </c:if>
            </div>
        </nav>
    </div>
</header>
