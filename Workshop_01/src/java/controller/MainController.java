/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProjectsDAO;
import dao.UserDAO;
import dto.ProjectsDTO;
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

                    } else {
                        request.setAttribute("message", "Incorrect Username or Password");
                        url = "login.jsp";
                    }
                } else if (action.equals("logout")) {
                    request.getSession().invalidate();// huy session
                    url = "login.jsp";
                } else if (action.equals("search")) {
                    ProjectsDAO pdao = new ProjectsDAO();
                    String projectsName = request.getParameter("searchTerm");
                    List<ProjectsDTO> projects = (List<ProjectsDTO>) pdao.searchByProjectsName(projectsName);
                    request.setAttribute("projects", projects);
                    request.getSession().setAttribute("projectsName", projectsName);
                    url = "home.jsp";
                } else if (action.equals("updateProject")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    if (user == null) {
                        session.setAttribute("message", "You need to login!");
                    } else {
                        int projectId = Integer.parseInt(request.getParameter("projectsID"));
                        ProjectsDAO pdao = new ProjectsDAO();
                        ProjectsDTO project = pdao.readById(projectId);
                       

                        if (project != null) {
                            request.setAttribute("project", project);
                            url = "update.jsp";  // Điều hướng sang trang chỉnh sửa
                        } else {
                            request.setAttribute("message", "Project does not exist!");
                            url = "home.jsp";
                        }
                    }
                } // Thực hiện update
                else if (action.equals("update")) {
                    HttpSession session = request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");

                    if (user == null || !user.getRole().equalsIgnoreCase("Founder")) {
                        session.setAttribute("message", "Only Founder can update!");
                        url = "home.jsp";
                    } else {
                        int projectId = Integer.parseInt(request.getParameter("project_id"));
                        String newStatus = request.getParameter("status");

                        ProjectsDAO pdao = new ProjectsDAO();
                        boolean updated = pdao.updateStatus(projectId, newStatus);

                        if (updated) {
                            session.setAttribute("message", "Update successful!");
                        } else {
                            session.setAttribute("message", "Update failed!");
                        }
                        url = "home.jsp";  // Trở về trang chính sau khi cập nhật
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
