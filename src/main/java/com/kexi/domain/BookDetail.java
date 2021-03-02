package com.kexi.domain;

public class BookDetail {
    private String id;
    private String publicationDate; //20
    private String isbn; //20
    private String intro; //500
    private String image; //50
    private String location;
    private Integer number; //馆藏数，默认0

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

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
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

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "BookDetail{" +
                "id='" + id + '\'' +
                ", publicationDate='" + publicationDate + '\'' +
                ", isbn='" + isbn + '\'' +
                ", intro='" + intro + '\'' +
                ", image='" + image + '\'' +
                ", location='" + location + '\'' +
                ", number=" + number +
                '}';
    }
}
