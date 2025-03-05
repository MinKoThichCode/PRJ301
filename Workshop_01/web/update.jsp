<%-- 
    Document   : update
    Created on : Mar 4, 2025, 4:10:48 PM
    Author     : ADMIN
--%>

<%@ page import="java.util.*, dto.ProjectsDTO" %>

<%
    ProjectsDTO projects = (ProjectsDTO) request.getAttribute("project");
    if (projects == null) {
        response.sendRedirect("home.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Update status</title>
    </head>
    <body>
        <h2>Project status update</h2>
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="project_id" value="<%= projects.getProjectsID()%>" />

            <label>Project name:</label>
            <input type="text" value="<%= projects.getProjectsName()%>" readonly /><br/>

            <label>Current status:</label>
            <input type="text" value="<%= projects.getStatus()%>" readonly /><br/>

            <label>Select new status:</label>
            <select name="status">
                <option value="Ideation">Ideation</option>
                <option value="Development">Development</option>
                <option value="Launch">Launch</option>
                <option value="Scaling">Scaling</option>
            </select><br/>

            <button type="submit">Update</button>
        </form>

        <a href="home.jsp">Back</a>
    </body>
</html>
