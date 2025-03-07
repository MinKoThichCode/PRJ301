<%-- 
    Document   : home
    Created on : Mar 2, 2025, 11:57:16 AM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="dto.ProjectsDTO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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





        </style>


    </head>
    <body> 


        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
        <div class="alert"><%= message%></div>
        <%
                session.removeAttribute("message"); // remove it after displaying
            }
        %>





        <%
            UserDTO user = (UserDTO) session.getAttribute("user");
        %>

        <h1>Welcome <%=user.getName()%></h1>

        <div>
            <form action="MainController">
                <input type="hidden" name="action" value="logout">
                <input type="submit" value="Logout">
            </form>
            <br>

            <%
                String projectsName = session.getAttribute("projectsName") + "";
                projectsName = projectsName.equals("null") ? "" : projectsName;

            %>


            <%                if (user != null && user.getRole().equalsIgnoreCase("Founder")) {


            %>


            <form action="MainController">
                <input type="hidden" name="action" value="search"/>
                Search Projects: <input type="text" name="searchTerm" value="<%=projectsName%>"> 
                <input type="submit" value="Search"> 
                <br>
                <a href="MainController?action=createProjects">Create New Project</a>

            </form>


            <%
                
                }

            %>

            <br/>
            <br/>

            <%                if (request.getAttribute("projects") != null) {
                    List<ProjectsDTO> projects = (List<ProjectsDTO>) request.getAttribute("projects");
            %>
            <table class="book-table">
                <thead>
                    <tr>
                        <th>project_id</th>
                        <th>project_name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>estimated_launch</th>
                        <th>Action</th>

                    </tr>
                </thead>
                <tbody>
                    <%
                        for (ProjectsDTO p : projects) {

                    %> 
                    <tr>
                        <td><%= p.getProjectsID()%></td>
                        <td><%= p.getProjectsName()%></td>
                        <td><%= p.getDescription()%></td>
                        <td><%= p.getStatus()%></td>
                        <td><%= p.getEstimatedLaunch()%></td>
                        <td><a href="MainController?action=updateProjects&projectsID=<%= p.getProjectsID()%>">
                                <img src="assets/img/edit-icon.png" style="height: 25px"/>


                            </a></td>
                    </tr>

                    <%   }


                    %>
                </tbody>
            </table>

            <%                        }
            %>



        </div>


    </body>
</html>
