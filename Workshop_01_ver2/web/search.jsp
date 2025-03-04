<%-- 
    Document   : search
    Created on : Feb 16, 2025, 1:04:55 PM
    Author     : ADMIN
--%>

<%@page import="dto.ProjectsDTO"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-16WWW">
        <title>JSP Page</title>

        <style>
            .book-table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 14px;
                font-family: Arial, sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .book-table thead th {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
                font-weight: bold;
                padding: 12px 15px;
            }

            .book-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .book-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .book-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }

            .book-table tbody td {
                padding: 12px 15px;
            }

            .book-table tbody tr:hover {
                background-color: #f5f5f5;
                transition: 0.3s ease;
            }

            /* Responsive design */
            @media screen and (max-width: 600px) {
                .book-table {
                    font-size: 12px;
                }

                .book-table thead th,
                .book-table tbody td {
                    padding: 8px 10px;
                }
            }
        </style> 
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">
            <%                if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
            %>
            <h1> Welcome <%=user.getUserName()%> </h1>
            <form action="MainController">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout"/>
            </form>

            <br/>
            
            <%
              String searchTerm = request.getAttribute("searchTerm") + "";
              searchTerm = searchTerm.equals("null")?"":searchTerm;
                
                %>
            

            <form action="MainController">
                <input type="hidden" name="action" value="search"/>
                Search Projects: <input type="text" name="searchTerm" value="<%= searchTerm %>"/>
                <input type="submit" value="Search"/>
            </form>

            <%
                if (request.getAttribute("projects") != null) {
                    List<ProjectDTO> projects = (List<ProjectsDTO>) request.getAttribute("projects");

            %>
            <table class="book-table">
                <thead>
                    <tr>
                         <th>project_id</th>
                        <th>project_name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>estimated_launch</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%            for (ProjectDTO p : projects) {
                    %>
                    <tr>
                        <td><%= p.getProjectsID()%></td>
                        <td><%= p.getProjectsName()%></td>
                        <td><%= p.getDescription()%></td>
                        <td><%= p.getStatus()%></td>
                        <td><%= p.getEstimatedLaunch()%></td>
                        <td><a href="MainController?action=delete&id=<%=b.getBookID()%>&searchTerm=<%=searchTerm%>">
                <img src="assets/images/delete-file-icon.png" style="width: 30px">
                                  </a> </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%    }
            } else { %>
            You do not have permission to access this content.
            <%}%>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>