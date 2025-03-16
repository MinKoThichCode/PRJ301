<%-- 
    Document   : add
    Created on : Mar 16, 2025, 5:58:54 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Question</title>
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
            input, textarea, select {
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
            <h2>Add New Question</h2>
            <form action="MainController" method="post">
                <!-- Action này sẽ được xử lý để lưu câu hỏi mới --> 
                <input type="hidden" name="action" value="saveQuestion" />
                <!-- Giả sử exam_id đã được truyền vào trang --> 
                <input type="hidden" name="exam_id" value="<%= request.getParameter("exam_id")%>" >

                <label for="question_text">Question Text:</label>
                <textarea id="question_text" name="question_text" rows="4" required></textarea>

                <label for="option_a">Option A:</label>
                <input type="text" id="option_a" name="option_a" required />

                <label for="option_b">Option B:</label>
                <input type="text" id="option_b" name="option_b" required />

                <label for="option_c">Option C:</label>
                <input type="text" id="option_c" name="option_c" required />

                <label for="option_d">Option D:</label>
                <input type="text" id="option_d" name="option_d" required />

                <label for="correct_option">Correct Option:</label>
                <select id="correct_option" name="correct_option" required>
                    <option value="">--Select--</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                </select>

                <button type="submit">Save Question</button>
            </form>
            <a href="home.jsp">Back to Home</a>
        </div>
    </body>
</html>
