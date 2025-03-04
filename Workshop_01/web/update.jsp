<%-- 
    Document   : update
    Created on : Mar 4, 2025, 4:10:48 PM
    Author     : ADMIN
--%>

<%@page import="dto.ProjectsDTO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Project Status</title>
        <style>
            .container {
                width: 50%;
                margin: auto;
                text-align: center;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
            }
            select, input {
                padding: 10px;
                margin: 10px;
            }
            .alert {
                color: green;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <%
            ProjectsDTO project = (ProjectsDTO) request.getAttribute("project");
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
        <div class="alert"><%= message %></div>
        <%
                session.removeAttribute("message");
            }
        %>

        <div class="container">
            <h2>Update Project Status</h2>
            <form action="MainController" method="POST">
                <input type="hidden" name="action" value="update" />
                <input type="hidden" name="project_id" value="<%= project.getProjectsID() %>" />

                <label>Project Name:</label>
                <input type="text" value="<%= project.getProjectsName() %>" disabled> <br>

                <label>Select New Status:</label>
                <select name="newStatus">
                    <option value="Ideation" <%= project.getStatus().equals("Ideation") ? "selected" : "" %>>Ideation</option>
                    <option value="Development" <%= project.getStatus().equals("Development") ? "selected" : "" %>>Development</option>
                    <option value="Launch" <%= project.getStatus().equals("Launch") ? "selected" : "" %>>Launch</option>
                    <option value="Scaling" <%= project.getStatus().equals("Scaling") ? "selected" : "" %>>Scaling</option>
                </select> <br>

                <input type="submit" value="Update Status">
            </form>
        </div>
    </body>
</html>
