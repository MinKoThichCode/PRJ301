<%-- 
    Document   : update
    Created on : Mar 16, 2025, 3:53:05 PM
    Author     : ADMIN
--%>

<%@ page import="java.util.*, dto.ExamDTO" %>

<%
    ExamDTO exam = (ExamDTO) request.getAttribute("exam");
    if (exam == null) {
        response.sendRedirect("home.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Exam</title>
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
            input[type="text"], input[type="number"] {
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
            <h2>Update Exam</h2>
            <form action="MainController" method="POST">
                <input type="hidden" name="action" value="update" />
                <input type="hidden" name="exam_id" value="<%= exam.getId()%>" />

                <label>Exam Title:</label>
                <input type="text" name="title" value="<%= exam.getTitle()%>" required />

                <label>Subject:</label>
                <input type="text" name="subject" value="<%= exam.getSubject()%>" required />

                <label>Duration (minutes):</label>
                <input type="number" name="duration" value="<%= exam.getDuration()%>" required />

                <label>Total Marks:</label>
                <input type="number" name="totalMarks" value="<%= exam.getTotalMarks()%>" required />

                <button type="submit">Update</button>
            </form>
            <a href="home.jsp">Back</a>
        </div>
    </body>
</html>
