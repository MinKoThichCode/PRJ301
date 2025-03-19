<%-- 
    Document   : viewResults
    Created on : Mar 19, 2025, 2:42:08 PM
    Author     : ADMIN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Exam Results</title>
        <style>
            /* Reset cơ bản */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Body */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f4f4f4;
                color: #333;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            /* Container chính */
            .container {
                max-width: 600px;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                text-align: center;
            }

            h2 {
                margin-bottom: 15px;
                color: #009879;
            }

            p {
                font-size: 16px;
                margin-bottom: 20px;
            }

            /* Nút trở về */
            .back-btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #009879;
                border: none;
                border-radius: 4px;
                color: #fff;
                font-size: 16px;
                text-decoration: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .back-btn:hover {
                background-color: #007f66;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Exam Results</h2>
            <%
                String message = (String) session.getAttribute("message");
                if (message != null) {
            %>
            <p><%= message%></p>
            <%
                }
            %>
            <a href="home.jsp" class="back-btn">Back to Home</a>
        </div>
    </body>
</html>
