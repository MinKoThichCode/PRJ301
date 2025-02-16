<%-- 
    Document   : example03
    Created on : Feb 10, 2025, 10:21:29 AM
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
        <%! int a = 100;%>

        <%
            if (a % 2 == 0) {
        %>

        <b> <h1 style="color: pink"> <%=a%> is even </h1> </b>
                        
          <% 
    } else {
        %>

        <b> <h1 style="color: pink"> <%=a%> is odd </h1> </b>
        
        <%

            }

        %>


    </body>
</html>
