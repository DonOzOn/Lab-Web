/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Digital;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DonOzOn
 */
public class DigitalDao {

    public DigitalDao() {
    }

    // get latest news
    public Digital getTop1() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String query = "SELECT top 1 * from digital order by timePost desc";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            rs = pr.executeQuery();
            while (rs.next()) {
                Digital digital = new Digital();
                digital.setId(rs.getInt("id"));
                digital.setTitle(rs.getString("title"));
                digital.setDescription(rs.getString("description"));
                digital.setImage(rs.getString("image"));
                digital.setAuthor(rs.getString("author"));
                digital.setShortDes(rs.getString("shortDes"));
                digital.setTimePost(rs.getDate("timePost"));
                return digital;
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return null;
    }
    
    //get top 5 lastest news except lastest
    public List<Digital> getTop5() throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        List<Digital> list = new ArrayList<>();
        try {
            String query = "SELECT top 5 * from digital d  "
                    + "where d.id != (select top 1 du.id from digital du order by timePost desc)"
                    + "order by timePost desc";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            rs = pr.executeQuery();
            while (rs.next()) {
                Digital digital = new Digital();
                digital.setId(rs.getInt("id"));
                digital.setTitle(rs.getString("title"));
                digital.setDescription(rs.getString("description"));
                digital.setImage(rs.getString("image"));
                digital.setAuthor(rs.getString("author"));
                digital.setShortDes(rs.getString("shortDes"));
                digital.setTimePost(rs.getDate("timePost"));
                list.add(digital);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return list;
    }

    // search news 
    public List<Digital> seacrh(String text, int pageIndex, int pageSize) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        List<Digital> list = new ArrayList<>();
        int size = count(text);
        try {
            String query = "select * from ( select ROW_NUMBER() over (order by id ASC) as rn , *"
                    + " from  digital where title like ?) "
                    + "as b where rn between ((?*?) - ?)and (?*?)";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            pr.setString(1, "%" + text + "%");
            pr.setInt(2, pageSize);
            pr.setInt(3, pageIndex);
            pr.setInt(4, pageSize - 1);
            pr.setInt(5, pageSize);
            pr.setInt(6, pageIndex);
            rs = pr.executeQuery();
            while (rs.next()) {
                Digital digital = new Digital();
                digital.setId(rs.getInt("id"));
                digital.setTitle(rs.getString("title"));
                digital.setDescription(rs.getString("description"));
                digital.setImage(rs.getString("image"));
                digital.setAuthor(rs.getString("author"));
                digital.setShortDes(rs.getString("shortDes"));
                digital.setTimePost(rs.getDate("timePost"));
                list.add(digital);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return list;
    }

    // find news by id
    public Digital getOne(int id) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String query = "SELECT top 1 * from digital where id = ?";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            pr.setInt(1, id);
            rs = pr.executeQuery();
            while (rs.next()) {
                Digital digital = new Digital();
                digital.setId(rs.getInt("id"));
                digital.setTitle(rs.getString("title"));
                digital.setDescription(rs.getString("description"));
                digital.setImage(rs.getString("image"));
                digital.setAuthor(rs.getString("author"));
                digital.setShortDes(rs.getString("shortDes"));
                digital.setTimePost(rs.getDate("timePost"));
                return digital;
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return null;
    }

    // count number of news search
    public int count(String text) throws Exception {
        DBContext db = new DBContext();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String query = "SELECT count(*) from digital where title like ?";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            pr.setString(1, "%" + text + "%");
            rs = pr.executeQuery();
            int cout = 0;
            while (rs.next()) {
                cout = rs.getInt(1);

            }
            return cout;
        } catch (Exception ex) {
            throw ex;
        } finally {
           db.closeConnection(rs, pr, conn);
        }
    }
}
