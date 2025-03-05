/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProjectsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class ProjectsDAO implements IDAO<ProjectsDTO, String> {

    @Override
    public boolean create(ProjectsDTO entity) {
        return false;
    }

    @Override
    public List<ProjectsDTO> readAll() {
        return null;
    }

    public List<ProjectsDTO> searchByProjectsName(String searchTerm) {
        String sql = "SELECT * FROM tblStartupProjects WHERE [project_name] LIKE ? ";
        List<ProjectsDTO> list = new ArrayList<ProjectsDTO>();

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProjectsDTO projects = new ProjectsDTO(
                        rs.getInt("project_id"),
                        rs.getString("project_name"),
                        rs.getString("Description"),
                        rs.getString("Status"),
                        rs.getDate("estimated_launch")
                );

                list.add(projects);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;

    }

    @Override
    public boolean update(ProjectsDTO entity) {
        String sql = "UPDATE [tbltblStartupProjects] SET "
                + "[Status] =? "
                + "WHERE [project_id] = ?";
        Connection conn;
        try {
            conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getStatus());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<ProjectsDTO> search(String searchTerm) {
        return null;
    }

    @Override
    public ProjectsDTO readByUsername(String id) {
        return null;
    }

   

    public boolean updateStatus(int projectId, String newStatus) {
        String sql = "UPDATE tblStartupProjects SET Status = ? WHERE project_id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, newStatus);
            ps.setInt(2, projectId);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    public ProjectsDTO readById(int projectId) {
        String sql = "SELECT project_id, project_name, Description, Status, estimated_launch "
                + "FROM tblStartupProjects WHERE project_id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, projectId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ProjectsDTO(
                            rs.getInt("project_id"),
                            rs.getString("project_name"),
                            rs.getString("Description"),
                            rs.getString("Status"),
                            rs.getDate("estimated_launch")
                    );
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
