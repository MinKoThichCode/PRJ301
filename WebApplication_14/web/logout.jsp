<%-- 
    Document   : logout
    Created on : Feb 17, 2025, 10:37:22 AM
    Author     : ADMIN
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">

            <h4>You are logged out</h4>
            <a href="MainController">Back to login</a>
        </div>
        <jsp:include page="footer.jsp"/>    
    </body>

</html>
