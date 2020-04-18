/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author DonOzOn
 */
public class UserDao {

    public UserDao() {
    }

    //login
    public User login(String userName, String password) throws Exception {
        User returnValue = null;
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("select * from Users where username=? and password=?");
            pr.setString(1, userName);
            pr.setString(2, password);
            rs = pr.executeQuery();
            while (rs.next()) {
                returnValue = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getInt("type"));
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return returnValue;
    }

    // validate user regist
    public int validateNewUser(User user) throws Exception {
        int returnValue = 0;
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("select * from Users where username=? or email=?");
            pr.setString(1, user.getUserName());
            pr.setString(2, user.getEmail());
            rs = pr.executeQuery();
            while (rs.next()) {
                if (rs.getString("username").equals(user.getUserName())) {
                    returnValue = 1;
                    break;
                }
                if (rs.getString("email").equals(user.getEmail())) {
                    returnValue = 2;
                    break;
                }
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return returnValue;
    }

    //add new user
    public void addUser(User newUser) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            conn = db.getConnection();
            pr = conn.prepareStatement("Insert into Users (username,password,email,type) values(?,?,?,?)");
            pr.setString(1, newUser.getUserName());
            pr.setString(2, newUser.getPassword());
            pr.setString(3, newUser.getEmail());
            pr.setInt(4, newUser.getType());
            pr.execute();
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
    }
}
