/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ExamDTO;

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
public class ExamDAO {

    public boolean create(ExamDTO entity) {
        String sql = "INSERT INTO tblExams (exam_title, subject, category_id, total_marks, duration) "
                + "VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, entity.getTitle());
            ps.setString(2, entity.getSubject());
            ps.setInt(3, entity.getCategoryId());
            ps.setInt(4, entity.getTotalMarks());
            ps.setInt(5, entity.getDuration());

            return ps.executeUpdate() > 0;

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ExamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<ExamDTO> readAll() {
        String sql = "SELECT * FROM tblExams";
        List<ExamDTO> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ExamDTO exam = new ExamDTO(
                        rs.getInt("exam_id"),
                        rs.getString("exam_title"),
                        rs.getString("subject"),
                        rs.getInt("category_id"),
                        rs.getInt("total_marks"),
                        rs.getInt("duration")
                );
                list.add(exam);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public ExamDTO readByID(Integer id) {
        String sql = "SELECT * FROM tblExams WHERE exam_id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ExamDTO(
                            rs.getInt("exam_id"),
                            rs.getString("exam_title"),
                            rs.getString("subject"),
                            rs.getInt("category_id"),
                            rs.getInt("total_marks"),
                            rs.getInt("duration")
                    );
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(ExamDTO entity) {
        String sql = "UPDATE tblExams SET exam_title = ?, "
                + "subject = ?, "
                + "category_id = ?, "
                + "total_marks = ?, "
                + "duration = ? "
                + "WHERE exam_id = ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, entity.getTitle());
            ps.setString(2, entity.getSubject());
            ps.setInt(3, entity.getCategoryId());
            ps.setInt(4, entity.getTotalMarks());
            ps.setInt(5, entity.getDuration());
            ps.setInt(6, entity.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(Integer id) {
        String sql = "DELETE FROM tblExams WHERE exam_id = ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<ExamDTO> search(String searchTerm) {

        String sql = "SELECT * FROM tblExams WHERE exam_title LIKE ? OR subject LIKE ?";
        List<ExamDTO> list = new ArrayList<>();
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + searchTerm + "%");
            ps.setString(2, "%" + searchTerm + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new ExamDTO(
                            rs.getInt("exam_id"),
                            rs.getString("exam_title"),
                            rs.getString("subject"),
                            rs.getInt("category_id"),
                            rs.getInt("total_marks"),
                            rs.getInt("duration")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ExamDTO> getExamsByCategory(int categoryId) {
        String sql = "SELECT * FROM tblExams WHERE category_id = ?";
        List<ExamDTO> exams = new ArrayList<>();

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                exams.add(new ExamDTO(
                        rs.getInt("exam_id"),
                        rs.getString("exam_title"),
                        rs.getString("subject"),
                        rs.getInt("category_id"),
                        rs.getInt("total_marks"),
                        rs.getInt("duration")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exams;
    }

    public ExamDTO getExamById(int examId) {
        String sql = "SELECT * FROM tblExams WHERE exam_id = ?";

        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, examId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new ExamDTO(
                        rs.getInt("exam_id"),
                        rs.getString("exam_title"),
                        rs.getString("subject"),
                        rs.getInt("category_id"),
                        rs.getInt("total_marks"),
                        rs.getInt("duration")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateExam(int examId, String title, String subject, int duration, int totalMarks) {
        String sql = "UPDATE tblExams SET exam_title = ?, subject = ?, duration = ?, total_marks = ? WHERE exam_id = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, title);
            ps.setString(2, subject);
            ps.setInt(3, duration);
            ps.setInt(4, totalMarks);
            ps.setInt(5, examId);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addQuestion(int examId, String questionText, String optionA,
            String optionB,
            String optionC, String optionD, String correctOption) {
        String sql = "INSERT INTO tblQuestions (exam_id, question_text,"
                + " option_a,"
                + " option_b, option_c,"
                + " option_d, correct_option) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, examId);
            ps.setString(2, questionText);
            ps.setString(3, optionA);
            ps.setString(4, optionB);
            ps.setString(5, optionC);
            ps.setString(6, optionD);
            ps.setString(7, correctOption);

            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
        return false;

    }
}
