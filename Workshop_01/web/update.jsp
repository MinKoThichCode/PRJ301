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
        <title>Update Status</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }
            .container {
                background-color: #fff;
                padding: 30px 40px;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
                max-width: 500px;
                width: 100%;
            }
            h2 {
                text-align: center;
                color: #333;
                margin-bottom: 20px;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin-top: 15px;
                font-weight: bold;
                color: #555;
            }
            input[type="text"], select {
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
            }
            input[readonly] {
                background-color: #e9e9e9;
            }
            button {
                margin-top: 20px;
                padding: 10px;
                background-color: #009879;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s ease;
            }
            button:hover {
                background-color: #007f66;
            }
            a {
                display: block;
                text-align: center;
                margin-top: 20px;
                text-decoration: none;
                color: #009879;
                font-weight: bold;
            }
            a:hover {
                color: #007f66;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Project Status Update</h2>
            <form action="MainController" method="POST">
                <input type="hidden" name="action" value="update" />
                <input type="hidden" name="project_id" value="<%= projects.getProjectsID() %>" />

                <label>Project Name:</label>
                <input type="text" value="<%= projects.getProjectsName() %>" readonly />

                <label>Current Status:</label>
                <input type="text" value="<%= projects.getStatus() %>" readonly />

                <label>Select New Status:</label>
                <select name="status">
                    <option value="Ideation">Ideation</option>
                    <option value="Development">Development</option>
                    <option value="Launch">Launch</option>
                    <option value="Scaling">Scaling</option>
                </select>

                <button type="submit">Update</button>
            </form>
            <a href="home.jsp">Back</a>
        </div>
    </body>
</html>
