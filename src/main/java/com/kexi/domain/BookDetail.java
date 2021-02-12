package com.kexi.domain;

public class BookDetail {
    private String id;
    private String publicationDate; //20
    private String ISBN; //20
    private String intro; //500
    private String image; //50
    private String location;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(String publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "BookDetail{" +
                "id='" + id + '\'' +
                ", publicationDate='" + publicationDate + '\'' +
                ", ISBN='" + ISBN + '\'' +
                ", intro='" + intro + '\'' +
                ", image='" + image + '\'' +
                ", location='" + location + '\'' +
                '}';
    }
}
