/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Question;
import entity.QuestionHistory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author DonOzOn
 */
public class QuestionHistoryDao {

    private SimpleDateFormat formatter;

    public QuestionHistoryDao() {
        formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    }

    //get all history of quiz
    public List<QuestionHistory> getQuestionsHistory() throws Exception {
        List<QuestionHistory> history = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("Select QuizHistory.*, Users.username from QuizHistory inner join Users on QuizHistory.studentId = Users.id;");
            rs = pr.executeQuery();

            while (rs.next()) {
                history.add(new QuestionHistory(rs.getInt("id"), rs.getString("username"), rs.getInt("numOfQuiz"), rs.getInt("correctAnswer"), rs.getDate("date"), rs.getString("status")));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return history;
    }

    //get all history of quiz
    public void addQuestonHistory(int stdID, int numQuiz, int correctAns, Date date, String status) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("insert into QuizHistory(studentId, numOfQuiz, correctAnswer, date,status) values(?,?,?,?,?)");
            pr.setInt(1, stdID);
            pr.setInt(2, numQuiz);
            pr.setInt(3, correctAns);
            pr.setString(4, formatter.format(date));
            pr.setString(5, status);
            pr.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
    }

}
