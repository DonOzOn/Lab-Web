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
public class Galery {
       private int ID;
    private String title;
    private String description;
    private String name;
    private String image;
    

    public Galery() {
    }

    public Galery(int ID, String title, String description) {
        this.ID = ID;
        this.title = title;
        this.description = description;
    }

    public String getImage(){
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
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

    @Override
    public String toString() {
        return "Galery{" + "ID=" + ID + ", title=" + title + ", description=" + description + '}';
    }
    

}
