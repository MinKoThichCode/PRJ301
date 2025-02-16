<%-- 
    Document   : output
    Created on : Feb 10, 2025, 11:04:35 AM
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
        
        <%
            int n = (int) request.getAttribute("n");
            %>
            
            <b>  <h2> Bang Cuu Chuong <%=n%> </h2> </b> </br> 

<%
    for (int j = 1; j <= 10; j++) {

%>

<span style="color: red">  <%=n%> * <%=j%> = <%= (n * j)%> </span> </br> 
<%
        }
   
%>




 

        <%
            if (n % 2 == 0) {
        %>

        <b> <h1 style="color: pink"> <%=n%> is even </h1> </b>
                        
          <% 
    } else {
        %>

        <b> <h1 style="color: pink"> <%=n%> is odd </h1> </b>
        
        <%

            }

        %>


</body>
</html>
