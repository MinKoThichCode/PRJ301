<%-- 
    Document   : header
    Created on : Mar 2, 2025, 3:58:44 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .header {
        background-color: #1e1e2f;
        padding: 1rem 0;
        width: 100%;
        top: 0;
        position: fixed;
        z-index: 1000;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
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
        color: #f39c12;
        font-size: 1.8rem;
        font-weight: bold;
        text-decoration: none;
    }

    .menu {
        display: flex;
        list-style: none;
        gap: 1.5rem;
    }

    .menu-item a {
        color: #fff;
        text-decoration: none;
        font-size: 1rem;
        transition: color 0.3s ease;
    }

    .menu-item a:hover {
        color: #f39c12;
    }

    .search-bar {
        display: flex;
        align-items: center;
        background: #fff;
        border-radius: 20px;
        padding: 0.5rem 1rem;
    }

    .search-input {
        border: none;
        outline: none;
        padding: 0.2rem;
        width: 180px;
    }

    .search-button {
        background: none;
        border: none;
        cursor: pointer;
        color: #1e1e2f;
        font-size: 1.2rem;
    }

    @media (max-width: 768px) {
        .nav {
            flex-direction: column;
            gap: 1rem;
        }

        .menu {
            flex-direction: column;
            align-items: center;
        }
    }
</style>

<header class="header">
    <div class="container">
        <nav class="nav">
            <a href="#" class="logo">Startup Manager</a>
            <ul class="menu">
                <li class="menu-item"><a href="#">Trang chủ</a></li>
                <li class="menu-item"><a href="#">Dự án</a></li>
                <li class="menu-item"><a href="#">Tài nguyên</a></li>
                <li class="menu-item"><a href="#">Liên hệ</a></li>
            </ul>
            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Tìm kiếm dự án...">
                <button class="search-button">🔍</button>
            </div>
        </nav>
    </div>
</header>
