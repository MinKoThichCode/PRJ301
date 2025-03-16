<%-- 
    Document   : login
    Created on : Mar 16, 2025, 10:53:16 AM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="assets/css/login.css">
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

            <%=message.equals("null") ? "" : message%>




        </div>

        <div class="footer">
            <jsp:include page="footer.jsp"/>

        </div>

    </body>
</html>
