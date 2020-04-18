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
public class Contact {

    private String telephone;
    private String email;
    private String face_url;
    private String twitter_url;
    private String google_url;
    private String about;
    private String address;
    private String city;
    private String country;
    private String map_url;
    private String image_main;
    private String icon_face;
    private String icon_twitter;
    private String icon_google;
    private String description;
    
    public Contact() {
    }


    public String getIcon_face() throws Exception {
         DBContext db = new DBContext();
        return db.getImagePath() +icon_face;
    }

        public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public void setIcon_face(String icon_face) {
        this.icon_face = icon_face;
    }

    public String getIcon_twitter() throws Exception {
        DBContext db = new DBContext();
        return db.getImagePath() + icon_twitter;
    }

    public void setIcon_twitter(String icon_twitter) {
        
        this.icon_twitter = icon_twitter;
    }

    public String getIcon_google() throws Exception {
         DBContext db = new DBContext();
        return db.getImagePath() +  icon_google;
    }

    public void setIcon_google(String icon_google) {
        this.icon_google = icon_google;
    }

    public String getImage_main() throws Exception {
        DBContext db = new DBContext();
        return db.getImagePath() + image_main;
    }

    public void setImage_main(String image_main) {
        this.image_main = image_main;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFace_url() {
        return face_url;
    }

    public void setFace_url(String face_url) {
        this.face_url = face_url;
    }

    public String getTwitter_url() {
        return twitter_url;
    }

    public void setTwitter_url(String twitter_url) {
        this.twitter_url = twitter_url;
    }

    public String getGoogle_url() {
        return google_url;
    }

    public void setGoogle_url(String google_url) {
        this.google_url = google_url;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMap_url() {
        return map_url;
    }

    public void setMap_url(String map_url) {
        this.map_url = map_url;
    }

}
