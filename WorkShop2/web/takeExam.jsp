<%-- 
    Document   : takeExam
    Created on : Mar 19, 2025, 2:29:40 PM
    Author     : ADMIN
--%>

<%@ page import="java.util.List, dto.QuestionDTO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Take Exam</title>
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
                padding: 20px;
            }

            /* Container chính */
            .container {
                max-width: 800px;
                margin: auto;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .question {
                margin-bottom: 20px;
            }

            .question p {
                font-weight: 600;
                margin-bottom: 8px;
            }

            .options {
                margin-left: 20px;
                line-height: 1.8;
            }

            /* Radio button */
            input[type="radio"] {
                margin-right: 5px;
            }

            /* Nút Submit */
            input[type="submit"] {
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #009879;
                border: none;
                border-radius: 4px;
                color: #fff;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            input[type="submit"]:hover {
                background-color: #007f66;
            }

            /* Khoảng cách giữa các câu hỏi */
            hr {
                border: none;
                border-top: 1px solid #ddd;
                margin: 20px 0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Take Exam</h2>
            <form action="MainController" method="post">
               
                <input type="hidden" name="action" value="submitExam">
                <input type="hidden" name="examID" value="<%= request.getAttribute("examID")%>">

                <%
                    List<QuestionDTO> questions = (List<QuestionDTO>) request.getAttribute("questions");
                    if (questions != null) {
                        int i = 1;
                        for (QuestionDTO q : questions) {
                %>
                <div class="question">
                    <p><%= i++%>. <%= q.getQuestionText()%></p>
                    <div class="options">
                        <label>
                            <input type="radio" name="answer_<%= q.getQuestionId()%>" value="A">
                            A. <%= q.getOptionA()%>
                        </label><br>

                        <label>
                            <input type="radio" name="answer_<%= q.getQuestionId()%>" value="B">
                            B. <%= q.getOptionB()%>
                        </label><br>

                        <label>
                            <input type="radio" name="answer_<%= q.getQuestionId()%>" value="C">
                            C. <%= q.getOptionC()%>
                        </label><br>

                        <label>
                            <input type="radio" name="answer_<%= q.getQuestionId()%>" value="D">
                            D. <%= q.getOptionD()%>
                        </label><br>
                    </div>
                </div>
                <hr>
                <%
                        }
                    }
                %>

                <input type="submit" value="Submit Exam">
            </form>
        </div>
    </body>
</html>

