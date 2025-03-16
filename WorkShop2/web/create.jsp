<%-- 
    Document   : create
    Created on : Mar 16, 2025, 4:41:03 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Create New Exam</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            .container {
                max-width: 600px;
                margin: auto;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            h2 {
                text-align: center;
                color: #333;
            }
            label {
                display: block;
                margin-top: 15px;
                font-weight: bold;
            }
            input, select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                margin-top: 20px;
                padding: 10px;
                width: 100%;
                background-color: #009879;
                border: none;
                border-radius: 4px;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
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
            <h2>Create New Exam</h2>
            <form action="MainController" method="post">
                <!-- Gửi action là createExam để controller nhận biết --> 
                <input type="hidden" name="action" value="create" />

                <label for="examTitle">Exam Title:</label>
                <input type="text" id="examTitle" name="examTitle" required />

                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" required />

                <label for="category">Category:</label>
                <!-- Giả sử category được chọn từ danh sách có sẵn --> 
                <select id="category" name="category" required>
                    <option value="">--Select Category--</option>
                    <option value="1">Math</option>
                    <option value="2">Physics</option>
                    <option value="3">Science</option>
                    <option value="4">History</option>
                    <option value="5">Literature</option>
                </select>

                <label for="totalMarks">Total Marks:</label>
                <input type="number" id="totalMarks" name="totalMarks" required />

                <label for="duration">Duration (minutes):</label>
                <input type="number" id="duration" name="duration" required />

                <button type="submit">Create Exam</button>
            </form>
            <a href="home.jsp">Back to Home</a>
        </div>
    </body>
</html>
