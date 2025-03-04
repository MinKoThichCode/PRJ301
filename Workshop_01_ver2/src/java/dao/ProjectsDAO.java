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
import java.util.ArrayList;
import java.util.List;
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
        String sql = "SELECT * FROM tblStartupProjects WHERE project_name LIKE ? ";
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
                        rs.getInt("estimated_launch")
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

    
    public ProjectsDTO readByUsername(String id) {
        return null;
    }

    @Override
    public ProjectsDTO readById(String id) {
        return null;
    }
    
    public boolean updateQuantityToZero(String id) {
       String sql = "UPDATE tblStartupProjectManagement SET Quantity=0 WHERE BookID=?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int i = ps.executeUpdate();
            return i >0;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return false;
    
    }

}
