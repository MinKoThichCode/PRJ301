<%-- 
    Document   : example04
    Created on : Feb 10, 2025, 10:31:47 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! int c;%> 
        <%
            for (int i = 2; i <= 9; i++) {
        %>

        <b> <h2 style="color: black"> Bang Cuu Chuong <%=i%> </h2> </b> </br> <hr>

        <%
            for (int j = 1; j <= 10; j++) {

        %>

         <span style="color: red">  <%=i%> * <%=j%> = <%=c = i * j%> </span> </br> 
        <%
                }
            }
        %>
    </body>
</html>
