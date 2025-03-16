/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ADMIN
 */
public class ExamDTO {

    private int id;
    private String title;
    private String subject;
    private int categoryId;
    private int totalMarks;
    private int duration;

    public ExamDTO() {
    }

    public ExamDTO(int id, String title, String subject, int categoryId, int totalMarks, int duration) {
        this.id = id;
        this.title = title;
        this.subject = subject;
        this.categoryId = categoryId;
        this.totalMarks = totalMarks;
        this.duration = duration;
    }

    public ExamDTO(String title, String subject, int categoryId, int totalMarks, int duration) {
        this.title = title;
        this.subject = subject;
        this.categoryId = categoryId;
        this.totalMarks = totalMarks;
        this.duration = duration;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getTotalMarks() {
        return totalMarks;
    }

    public void setTotalMarks(int totalMarks) {
        this.totalMarks = totalMarks;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
        return "ExamDTO{" + "id=" + id + ", title=" + title + ", subject=" + subject + ", categoryId=" + categoryId + ", totalMarks=" + totalMarks + ", duration=" + duration + '}';
    }
    
    
}
