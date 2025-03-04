/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class ProjectsDTO {
    
    private int projectsID;
    private String projectsName;
    private String description;
    private String status;
    private Date estimatedLaunch;

    public ProjectsDTO() {
    }

    public ProjectsDTO(int projectsID, String projectsName, String description, String status, Date estimatedLaunch) {
        this.projectsID = projectsID;
        this.projectsName = projectsName;
        this.description = description;
        this.status = status;
        this.estimatedLaunch = estimatedLaunch;
    }

    public int getProjectsID() {
        return projectsID;
    }

    public void setProjectsID(int projectsID) {
        this.projectsID = projectsID;
    }

    public String getProjectsName() {
        return projectsName;
    }

    public void setProjectsName(String projectsName) {
        this.projectsName = projectsName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getEstimatedLaunch() {
        return estimatedLaunch;
    }

    public void setEstimatedLaunch(Date estimatedLaunch) {
        this.estimatedLaunch = estimatedLaunch;
    }

    @Override
    public String toString() {
        return "ProjectsDTO{" + "projectsID=" + projectsID + ", projectsName=" + projectsName + ", description=" + description + ", status=" + status + ", estimatedLaunch=" + estimatedLaunch + '}';
    }

   

}