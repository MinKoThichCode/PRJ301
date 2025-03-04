<%-- 
    Document   : login
    Created on : Mar 2, 2025, 11:47:55 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập - Startup Manager</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                background-color: #f0f2f5;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
            }

            .login-container {
                background: #fff;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                width: 100%;
                max-width: 400px;
                text-align: center;
                margin-top: 170px; /* Tạo khoảng cách giữa header và form */
                margin-bottom: 90px; /* Tạo khoảng cách giữa form và footer */
            }

            .login-title {
                font-size: 1.5rem;
                font-weight: bold;
                margin-bottom: 1.5rem;
                color: #2c3e50;
            }

            .form-group {
                margin-bottom: 1rem;
                text-align: left;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 0.5rem;
                color: #2c3e50;
            }

            .form-input {
                width: 100%;
                padding: 0.75rem;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 1rem;
            }

            .login-button {
                width: 100%;
                background: #3498db;
                color: white;
                border: none;
                padding: 0.75rem;
                font-size: 1rem;
                cursor: pointer;
                border-radius: 5px;
                margin-top: 1rem;
                transition: background 0.3s ease;
            }

            .login-button:hover {
                background: #2980b9;
            }

            .footer {
                margin-top: auto;
                width: 100%;
            }
        </style>
    </head>
    <body>

        <%@include file="header.jsp" %>

        <div class="login-container">
            <h2 class="login-title">Đăng nhập</h2>


            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login" />

                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="txtUsername" class="form-input" required />
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="txtPassword" class="form-input" required />
                </div>

                <button type="submit" class="login-button">Đăng nhập</button>
            </form>
    
            
            <%
                 
                String message = request.getAttribute("message") + "";

            %>
            
            <%=message.equals("null")?"":message%>




        </div>

        <div class="footer">
             <jsp:include page="footer.jsp"/>
            
        </div>

    </body>
</html>
