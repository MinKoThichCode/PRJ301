<%-- 
    Document   : search
    Created on : Feb 16, 2025, 1:04:55 PM
    Author     : ADMIN
--%>

<%@page import="dto.UserDTO"%>
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
            <%            UserDTO user = (UserDTO) request.getAttribute("user");
                user.getFullName();
            %>

            <h1>Welcome <%=user.getFullName()%> </h1>
            <a href="MainController?action=logout">Log out</a>
            <form action="#">
                Search Value: <input type="submit" name="txtSearchValue"/><br/>
                <input type="submit" name="Search"/>


            </form>  <h1>Hello World!</h1>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
