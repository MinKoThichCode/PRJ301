<%-- 
    Document   : home
    Created on : Mar 16, 2025, 12:05:45 PM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="dto.ExamDTO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Dashboard</title>
        <style>
            .exam-table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 14px;
                font-family: Arial, sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }
            .exam-table thead th {
                background-color: #009879;
                color: #ffffff;
                text-align: left;
                font-weight: bold;
                padding: 12px 15px;
            }
            .exam-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }
            .exam-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }
            .exam-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }
            .exam-table tbody td {
                padding: 12px 15px;
            }
            .exam-table tbody tr:hover {
                background-color: #f5f5f5;
                transition: 0.3s ease;
            }
        </style>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>


        <h1>Welcome <%= user.getName()%></h1>

        <form action="MainController">
            <input type="hidden" name="action" value="logout">
            <input type="submit" value="Logout">
        </form>
        <br>

        <%
            String msg = (String) session.getAttribute("message");
            if (msg != null) {
        %>
        <p style="color: green;"><%= msg%></p>
        <%
                session.removeAttribute("message");
            }
        %>





        <%
            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null") ? "" : searchTerm;
        %>

        <form action="MainController">
            <input type="hidden" name="action" value="search"/>
            Search Exam: <input type="text" name="searchTerm" value="<%=searchTerm%>"> 
            <input type="submit" value="Search"> 
            <br>
            <% if (user.getRole().equalsIgnoreCase("Instructor")) { %>
            <a href="MainController?action=createExam">Create New Exam</a> 

        </form>
        <% } %>
        <br/><br/>



        <form action="MainController">
            <input type="hidden" name="action" value="viewByCategory"/>
            <label>Filter by Category:</label>
            <select name="categoryId">
                <option value="1">Math</option>
                <option value="2">Physics</option>
                <option value="3">Science</option>
                <option value="4">History</option>
                <option value="5">Literature</option>
            </select>
            <input type="submit" value="Filter">
        </form>







        <% if (request.getAttribute("exams") != null) {
                List<ExamDTO> exams = (List<ExamDTO>) request.getAttribute("exams"); %>




        <table class="exam-table">
            <thead>
                <tr>
                    <th>Exam ID</th>
                    <th>Title</th>
                    <th>Subject</th>
                    <th>Category</th>
                    <th>Total Marks</th>
                    <th>Duration (minute)</th>
                    <th>Action</th>
                        <% if (user.getRole().equalsIgnoreCase("Instructor")) {%>
                    <th>Add Question</th>
                        <%}%>

                </tr>
            </thead>
            <tbody>
                <% for (ExamDTO e : exams) {%> 
                <tr>
                    <td><%= e.getId()%></td>
                    <td><%= e.getTitle()%></td>
                    <td><%= e.getSubject()%></td>
                    <td><%= e.getCategoryId()%></td>
                    <td><%= e.getTotalMarks()%></td>
                    <td><%= e.getDuration()%></td>

                    <td>
                        <% if (user.getRole().equalsIgnoreCase("Instructor")) {%>
                        <a href="MainController?action=updateExam&id=<%= e.getId()%>">
                            <img src="assets/img/edit-icon.png" style="height: 25px"/>
                        </a>



                        <% } else {%>
                        <a href="MainController?action=takeExam&examID=<%= e.getId()%>">Take Exam</a>
                        <% } %>
                    </td>

                    <td>
                        <% if (user.getRole().equalsIgnoreCase("Instructor")) {%>
                        <a href="MainController?action=addQuestion&exam_id=<%= e.getId()%>">Add Question</a>
                    </td>

                    <%}%>


                </tr>
                <% } %>
            </tbody>
        </table>
        <% }%>
    </body>
</html>
