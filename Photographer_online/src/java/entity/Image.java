/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import context.DBContext;

/**
 *
 * @author DonOzOn
 */
public class Image {

    private int id;
    private int galery_id;
    private String image_url;

    public Image() {
    }

    public Image(int id, int galery_id, String image_url) {
        this.id = id;
        this.galery_id = galery_id;
        this.image_url = image_url;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGalery_id() {
        return galery_id;
    }

    public void setGalery_id(int galery_id) {
        this.galery_id = galery_id;
    }

    public String getImage_url() throws Exception {
        DBContext db = new DBContext();
        return db.getImagePath()+image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
    
    
}
