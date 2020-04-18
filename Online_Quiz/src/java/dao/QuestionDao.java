/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DonOzOn
 */
public class QuestionDao {

    private SimpleDateFormat formatter;

    public QuestionDao() {
        formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    }

    // list all question
    public List<Question> getQuestions() throws Exception {
        List<Question> questions = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("Select * from Question");
            rs = pr.executeQuery();

            while (rs.next()) {
                Question q = new Question(rs.getInt("id"), rs.getString("content"), rs.getString("answer"), formatter.parse(rs.getString("created")));
                q.addOption(rs.getString("opt1"));
                q.addOption(rs.getString("opt2"));
                q.addOption(rs.getString("opt3"));
                q.addOption(rs.getString("opt4"));
                questions.add(q);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return questions;
    }
    
    // list random question
        public List<Question> getQuestionsRandom(int numQuiz) throws Exception {
        List<Question> questions = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("SELECT top (?) * FROM Question ORDER BY NEWID()");
            pr.setInt(1, numQuiz);
            rs = pr.executeQuery();

            while (rs.next()) {
                Question q = new Question(rs.getInt("id"), rs.getString("content"), rs.getString("answer"), formatter.parse(rs.getString("created")));
                q.addOption(rs.getString("opt1"));
                q.addOption(rs.getString("opt2"));
                q.addOption(rs.getString("opt3"));
                q.addOption(rs.getString("opt4"));
                questions.add(q);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return questions;
    }
        
   // list all question with paging
    public List<Question> getQuestionsInRange(int pageIndex, int pageSize) throws Exception, ParseException, ClassNotFoundException {
        List<Question> questions = new ArrayList<>();
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("Select * from (select ROW_NUMBER() Over (order by created desc) as r, * From Question) as  b where r between ((?*?) - ?)and (?*?)");
            pr.setInt(1, pageSize);
            pr.setInt(2, pageIndex);
            pr.setInt(3, pageSize - 1);
            pr.setInt(4, pageSize);
            pr.setInt(5, pageIndex);
            rs = pr.executeQuery();

            while (rs.next()) {
                Question q = new Question(rs.getInt("id"), rs.getString("content"), rs.getString("answer"), formatter.parse(rs.getString("created")));
                q.addOption(rs.getString("opt1"));
                q.addOption(rs.getString("opt2"));
                q.addOption(rs.getString("opt3"));
                q.addOption(rs.getString("opt4"));
                questions.add(q);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return questions;
    }

    //add question to DB
    public void addQueston(Question q) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("insert into Question (content, opt1, opt2, opt3, opt4, answer) values(?,?,?,?,?,?)");
            pr.setString(1, q.getContent());
            pr.setString(2, q.getOption().get(0));
            pr.setString(3, q.getOption().get(1));
            pr.setString(4, q.getOption().get(2));
            pr.setString(5, q.getOption().get(3));
            pr.setString(6, q.getAnswer());
            pr.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
    }

    //delete question
    public void deleteQueston(int id) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("delete from Question where id=?");
            pr.setInt(1, id);
            pr.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
    }

    // find question by id
    public Question findQuestionById(int id) throws Exception {
        Question returnValue = null;
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("SELECT * FROM Question WHERE id=?");
            pr.setInt(1, id);
            rs = pr.executeQuery();
            while (rs.next()) {
                returnValue = new Question(rs.getInt("id"), rs.getString("content"), rs.getString("answer"), formatter.parse(rs.getString("created")));
                returnValue.addOption(rs.getString("opt1"));
                returnValue.addOption(rs.getString("opt2"));
                returnValue.addOption(rs.getString("opt3"));
                returnValue.addOption(rs.getString("opt4"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return returnValue;
    }

    //get total question
    public int getQuestionSize() throws Exception {
        int returnValue = 0;
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("SELECT COUNT(*) as \"size\" FROM Question");
            rs = pr.executeQuery();
            rs.next();
            returnValue = rs.getInt("size");
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return returnValue;
    }
}
