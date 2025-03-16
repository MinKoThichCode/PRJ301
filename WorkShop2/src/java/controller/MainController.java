/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ExamDAO;
import dao.UserDAO;
import dto.ExamDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private ExamDAO edao = new ExamDAO();

    private static final String LOGIN_PAGE = "login.jsp";

    public UserDTO getUser(String strUsername) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readByUsername(strUsername);
        return user;
    }

    public boolean isValidLogin(String strUsername, String strPassword) {
        UserDTO user = getUser(strUsername);
        if (user != null && user.getPassword().equals(strPassword)) {
            return true;
        } else {
            return false;
        }
    }

    public void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        List<ExamDTO> exams = edao.search(searchTerm);
        request.setAttribute("exams", exams);
        request.getSession().setAttribute("searchTerm", searchTerm);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    String strUsername = request.getParameter("txtUsername");
                    String strPassword = request.getParameter("txtPassword");

                    if (isValidLogin(strUsername, strPassword)) {
                        url = "home.jsp";
                        UserDTO user = getUser(strUsername);
                        request.getSession().setAttribute("user", user);
                        //search
                        search(request, response);
                    } else {
                        request.setAttribute("message", "Incorrect Username or Password");
                        url = "login.jsp";
                    }
                } else if (action.equals("logout")) {
                    request.getSession().invalidate();// huy session
                    url = "login.jsp";
                } else if (action.equals("search")) {
                    search(request, response);
                    url = "home.jsp";

                } else if (action.equals("viewByCategory")) {
                    int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                    List<ExamDTO> exams = edao.getExamsByCategory(categoryId);
                    request.setAttribute("exams", exams);
                    url = "home.jsp";

                } else if (action.equals("updateExam")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    if (user == null || !user.getRole().equalsIgnoreCase("Instructor")) {
                        session.setAttribute("message", "Only Instructors can update exams!");
                        url = "home.jsp";
                    } else {
                        int examId = Integer.parseInt(request.getParameter("id"));
                        ExamDAO edao = new ExamDAO();
                        ExamDTO exam = edao.readByID(examId);

                        if (exam != null) {
                            request.setAttribute("exam", exam);
                            url = "update.jsp";
                        } else {
                            request.setAttribute("message", "Exam does not exist!");
                            url = "home.jsp";
                        }
                    }
                } else if (action.equals("update")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");

                    if (user != null && user.getRole().equalsIgnoreCase("Instructor")) {
                        int examId = Integer.parseInt(request.getParameter("exam_id"));
                        String newTitle = request.getParameter("title");
                        String newSubject = request.getParameter("subject");
                        int newDuration = Integer.parseInt(request.getParameter("duration"));
                        int newTotalMarks = Integer.parseInt(request.getParameter("totalMarks"));

                        ExamDAO edao = new ExamDAO();
                        boolean updated = edao.updateExam(examId, newTitle, newSubject, newDuration, newTotalMarks);

                        if (updated) {
                            session.setAttribute("message", "Update successful!");
                        } else {
                            session.setAttribute("message", "Update failed!");
                        }
                        url = "home.jsp";
                    }
                } else if (action.equals("createExam")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    // Chỉ Instructor mới được phép tạo bài thi
                    if (user == null || !user.getRole().equalsIgnoreCase("Instructor")) {
                        session.setAttribute("message", "Only Instructors can create exams!");
                        url = "home.jsp";
                    } else {
                        // Chuyển hướng đến form tạo bài thi: createExam.jsp
                        url = "create.jsp";
                    }
                } else if (action.equals("create")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    if (user != null && user.getRole().equalsIgnoreCase("Instructor")) {
                        // Lấy dữ liệu từ form createExam.jsp
                        String examTitle = request.getParameter("examTitle");
                        String subject = request.getParameter("subject");
                        String categoryStr = request.getParameter("category");
                        int categoryId = Integer.parseInt(categoryStr);
                        int totalMarks = Integer.parseInt(request.getParameter("totalMarks"));
                        int duration = Integer.parseInt(request.getParameter("duration"));

                        // Giả sử ExamDTO có constructor: ExamDTO(id, title, subject, categoryId, totalMarks, duration)
                        ExamDTO newExam = new ExamDTO(0, examTitle, subject, categoryId, totalMarks, duration);
                        boolean created = edao.create(newExam);
                        if (created) {
                            session.setAttribute("message", "Exam created successfully!");
                        } else {
                            session.setAttribute("message", "Exam creation failed!");
                        }
                    } else {
                        session.setAttribute("message", "Permission denied!");
                    }
                    url = "home.jsp";

                } else if (action.equals("addQuestion")) {
                    // Kiểm tra user
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    if (user == null || !user.getRole().equalsIgnoreCase("Instructor")) {
                        session.setAttribute("message", "Only Instructors can add questions!");
                        url = "home.jsp";
                    } else {
                        // Lấy exam_id từ request param
                        String examIdStr = request.getParameter("exam_id");
                        // Forward sang addQuestion.jsp
                        request.setAttribute("exam_id", examIdStr);
                        url = "add.jsp";
                    }
                } else if (action.equals("saveQuestion")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    if (user == null || !user.getRole().equalsIgnoreCase("Instructor")) {
                        session.setAttribute("message", "Only Instructors can add questions!");
                        url = "home.jsp";
                    } else {
                        // Lấy dữ liệu từ form addQuestion.jsp
                        int examId = Integer.parseInt(request.getParameter("exam_id"));
                        String questionText = request.getParameter("question_text");
                        String optionA = request.getParameter("option_a");
                        String optionB = request.getParameter("option_b");
                        String optionC = request.getParameter("option_c");
                        String optionD = request.getParameter("option_d");
                        String correctOption = request.getParameter("correct_option");

                        // Gọi hàm addQuestion(...) trong DAO
                        boolean added = edao.addQuestion(examId, questionText, optionA, optionB, optionC, optionD, correctOption);
                        if (added) {
                            session.setAttribute("message", "Question added successfully!");
                        } else {
                            session.setAttribute("message", "Failed to add question!");
                        }
                        url = "home.jsp";
                    }

                }
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);

            rd.forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
