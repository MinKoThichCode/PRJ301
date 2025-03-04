<%-- 
    Document   : invalid
    Created on : Feb 16, 2025, 1:06:14 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">
    <body>
        <h1>
            <font color="pink">
                Username or password invalid!
            </font>
        </h1>
        <a href="login.jsp">Click here to try again</a>
        <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
