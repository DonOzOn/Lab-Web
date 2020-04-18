/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Contact;
import entity.Galery;
import entity.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DonOzOn
 */
public class PhotoDao {

    public PhotoDao() {
    }

    // get latest news
    public List<Galery> getTop3Galery() throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        List<Galery> listGalery = new ArrayList<>();
        try {
            String query = "SELECT top 3 * from galery";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            rs = pr.executeQuery();
            while (rs.next()) {
                Galery galery = new Galery();
                galery.setID(rs.getInt("ID"));
                galery.setTitle(rs.getString("title"));
                galery.setDescription(rs.getString("description"));
                galery.setName(rs.getString("name"));
                listGalery.add(galery);
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return listGalery;
    }
    // get galery by id

    public Galery getGaleryByID(int id) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String query = "SELECT top 1 * from galery where ID = ?";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            pr.setInt(1, id);
            rs = pr.executeQuery();
            while (rs.next()) {
                Galery galery = new Galery();
                galery.setID(rs.getInt("ID"));
                galery.setTitle(rs.getString("title"));
                galery.setDescription(rs.getString("description"));
                galery.setName(rs.getString("name"));
                return galery;
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return null;
    }

    // get galery by id
    public Contact getContact() throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        List<Galery> listGalery = new ArrayList<>();
        try {
            String query = "SELECT top 1 * from contact";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            rs = pr.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setTelephone(rs.getString("telephone"));
                contact.setEmail(rs.getString("email"));
                contact.setFace_url(rs.getString("face_url"));
                contact.setTwitter_url(rs.getString("twitter_url"));
                contact.setGoogle_url(rs.getString("google_url"));
                contact.setAbout(rs.getString("about"));
                contact.setAddress(rs.getString("address"));
                contact.setCity(rs.getString("city"));
                contact.setCountry(rs.getString("country"));
                contact.setMap_url(rs.getString("map_url"));
                contact.setImage_main(rs.getString("image_main"));
                contact.setIcon_face(rs.getString("icon_face"));
                contact.setIcon_twitter(rs.getString("icon_twitter"));
                contact.setIcon_google(rs.getString("icon_google"));
                contact.setDescription(rs.getString("description"));
                return contact;
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return null;
    }
    // count number of galery

    public int count() throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String query = "SELECT count(*) from galery";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
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
    // get list galery with paging

    public List<Galery> getListGaleryWithPaging(int pageIndex, int pageSize) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        List<Galery> list = new ArrayList<>();
        int size = count();
        try {
            String query = "select * from ( select ROW_NUMBER() over (order by id ASC) as rn , * from  galery )"
                    + "as b where rn between ((?*?) - ?)and (?*?)";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            pr.setInt(1, pageSize);
            pr.setInt(2, pageIndex);
            pr.setInt(3, pageSize - 1);
            pr.setInt(4, pageSize);
            pr.setInt(5, pageIndex);
            rs = pr.executeQuery();
            while (rs.next()) {
                Galery galery = new Galery();
                galery.setID(rs.getInt("ID"));
                galery.setTitle(rs.getString("title"));
                galery.setDescription(rs.getString("description"));
                galery.setName(rs.getString("name"));
                if (getTop1ImageGalery(rs.getInt("ID")) != null) {
                    galery.setImage(getTop1ImageGalery(rs.getInt("ID")).getImage_url());
                }
//                else{
//                    galery.setImage("./images/noimage.jpg");
//                }
                list.add(galery);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return list;
    }
    // count number image of galery

    public int countImage(int id) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String query = "SELECT count(*) from image where galery_id = ?";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            pr.setInt(1, id);
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
    // get list galery with paging

    public List<Image> getListImageWithPaging(int galeryID, int pageIndex, int pageSize) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        List<Image> list = new ArrayList<>();
        int size = countImage(galeryID);
        try {
            String query = "select * from ( select ROW_NUMBER() over (order by id ASC) as rn , * from  image where galery_id = ?) "
                    + "as b where rn between ((?*?) - ?)and (?*?)";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            pr.setInt(1, galeryID);
            pr.setInt(2, pageSize);
            pr.setInt(3, pageIndex);
            pr.setInt(4, pageSize - 1);
            pr.setInt(5, pageSize);
            pr.setInt(6, pageIndex);
            rs = pr.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setId(rs.getInt("ID"));
                image.setGalery_id(rs.getInt("galery_id"));
                image.setImage_url(rs.getString("image_url"));
                list.add(image);
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return list;
    }
    // get image by id

    public Image getImageID(int id, int galeryId) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String query = "SELECT * from image where id = ? and galery_id = ?";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            pr.setInt(1, id);
            pr.setInt(2, galeryId);
            rs = pr.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setId(rs.getInt("ID"));
                image.setGalery_id(rs.getInt("galery_id"));
                image.setImage_url(rs.getString("image_url"));
                return image;
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return null;
    }
    // get top 1 imgae of galery

    public Image getTop1ImageGalery(int galeryID) throws Exception {
        DBContext db = DBContext.getInstance();
        Connection conn = null;
        PreparedStatement pr = null;
        ResultSet rs = null;
        try {
            String query = "SELECT top 1 * from image where galery_id = ?";
            conn = db.getConnection();
            pr = conn.prepareStatement(query);
            pr.setInt(1, galeryID);
            rs = pr.executeQuery();
            while (rs.next()) {
                Image image = new Image();
                image.setId(rs.getInt("ID"));
                image.setGalery_id(rs.getInt("galery_id"));
                image.setImage_url(rs.getString("image_url"));
                return image;
            }

        } catch (Exception ex) {
            throw ex;
        } finally {
            db.closeConnection(rs, pr, conn);
        }
        return null;
    }
}
