/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import context.DBContext;
import dao.DigitalDao;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author DonOzOn
 */
public class Digital {

    private int id;
    private String title;
    private String description;
    private String image;
    private String author;
    private String shortDes;
    private Date timePost;

    public Digital() {
    }

    public Digital(int id, String title, String description, String image, String author, String shortDes, Date timePost) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.image = image;
        this.author = author;
        this.shortDes = shortDes;
        this.timePost = timePost;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() throws Exception {
        DBContext db  = new DBContext();
        return db.getImagePath()+image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAuthor() {
        return "By " + author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setShortDes(String shortDes) {
        this.shortDes = shortDes;
    }

    public String getTimePost() {
        SimpleDateFormat dateFormat1 = new SimpleDateFormat("MMM dd yyyy - hh:mm");
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("a");
        String date = dateFormat1.format(this.timePost) + dateFormat2.format(this.timePost).toLowerCase();
        return "| " + date; 
    }

    public void setTimePost(Date timePost) {
        this.timePost = timePost;
    }

}
