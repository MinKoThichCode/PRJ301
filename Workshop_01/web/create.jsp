<%-- 
    Document   : create
    Created on : Mar 5, 2025, 10:02:56 AM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Create New Project</title>
    </head>
    <body>
        <h1>Create New Project</h1>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="create" />
            <label>Project Name:</label>
            <input type="text" name="project_name" required /><br/>

            <label>Description:</label>
            <textarea name="description" required></textarea><br/>

            <label>Status:</label>
            <select name="status">
                <option value="Ideation">Ideation</option>
                <option value="Development">Development</option>
                <option value="Launch">Launch</option>
                <option value="Scaling">Scaling</option>
            </select><br/>
          

            <label>Estimated Launch:</label>
            <input type="date" name="estimated_launch" required /><br/>

            <input type="submit" value="Create" />
        </form>
        <br/>
        <a href="home.jsp">Back</a>
    </body>
</html>

