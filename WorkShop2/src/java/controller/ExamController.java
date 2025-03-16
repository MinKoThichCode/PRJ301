/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ExamDAO;
import dto.ExamDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ExamController", urlPatterns = {"/ExamController"})
public class ExamController extends HttpServlet {

    private static final String HOME_PAGE = "home.jsp";
    private static final String CREATE_EXAM_PAGE = "createExam.jsp";
    private static final String UPDATE_EXAM_PAGE = "updateExam.jsp";

    private ExamDAO ed = new ExamDAO();

    private String processListExam(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ExamDTO> examList = ed.readAll();
        request.setAttribute("exams", examList);
        return HOME_PAGE;
    }

    private String processSearchExam(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        List<ExamDTO> examList = ed.search(searchTerm);
        request.setAttribute("exams", examList);
        // Có thể set lại searchTerm để hiển thị trong form tìm kiếm
        request.setAttribute("searchTerm", searchTerm);
        return HOME_PAGE;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                // Nếu không có action, mặc định liệt kê tất cả bài thi
                url = processListExam(request, response);
            } else if ("searchExam".equals(action)) {
                url = processSearchExam(request, response);
            } else {
                // Các action khác có thể được thêm vào ở đây (createExam, updateExam, ...)
                url = processListExam(request, response);
            }
        } catch (Exception e) {
            log("Error in ExamController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
