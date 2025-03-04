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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */




@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private ProjectsDAO projectsDAO = new ProjectsDAO();

    private static final String LOGIN_PAGE = "login.jsp";

    public UserDTO getUser(String strUserID) {
        UserDAO udao = new UserDAO();
        return udao.readById(strUserID);
    }

    public boolean isValidLogin(String strUserID, String strPassword) {
        UserDTO user = getUser(strUserID);
        return user != null && user.getPassword().equals(strPassword);
    }

    public void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        List<ProjectsDTO> projects = projectsDAO.searchByProjectsName(searchTerm);
        request.setAttribute("projects", projects);
        request.setAttribute("searchTerm", searchTerm);
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
                    String strUserID = request.getParameter("txtUsername");
                    String strPassword = request.getParameter("txtPassword");
                    if (isValidLogin(strUserID, strPassword)) {
                        url = "search.jsp";
                        UserDTO user = getUser(strUserID);
                        request.getSession().setAttribute("user", user);
                        search(request, response);
                    } else {
                        request.setAttribute("message", "Incorrect UserID or Password");
                        url = "login.jsp";
                    }
                } else if (action.equals("logout")) {
                    request.getSession().invalidate();
                    url = "login.jsp";
                } else if (action.equals("search")) {
                    search(request, response);
                    url = "search.jsp";
                } else if (action.equals("delete")) {
                    String id = request.getParameter("id");
                    projectsDAO.updateQuantityToZero(id);
                    search(request, response);
                    url = "search.jsp";
                } else if (action.equals("add")) {
                    try {
                        boolean checkError = false;

                        String projectID = request.getParameter("txtProjectID");
                        String title = request.getParameter("txtTitle");
                        String owner = request.getParameter("txtOwner");
                        int year = Integer.parseInt(request.getParameter("txtYear"));
                        double budget = Double.parseDouble(request.getParameter("txtBudget"));
                        int quantity = Integer.parseInt(request.getParameter("txtQuantity"));

                        if (projectID == null || projectID.trim().isEmpty()) {
                            checkError = true;
                            request.setAttribute("txtProjectID_error", "Project ID cannot be empty.");
                        }

                        if (quantity < 0) {
                            checkError = true;
                            request.setAttribute("txtQuantity_error", "Quantity must be >= 0.");
                        }

                        ProjectsDTO project = new ProjectsDTO(quantity, projectID, action, title, year);

                        if (!checkError) {
                            projectsDAO.create(project);
                            search(request, response);
                            url = "search.jsp";
                        } else {
                            url = "projectForm.jsp";
                            request.setAttribute("project", project);
                        }
                    } catch (Exception e) {
                        log("Error in add project: " + e.toString());
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Main Controller Servlet";
    }
}
