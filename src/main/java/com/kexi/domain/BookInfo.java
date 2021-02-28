package com.kexi.domain;

import java.util.Objects;

public class BookInfo {
    private String id;
    private String bookName; //20
    private String category; //20
    private String author; //20
    private String publisher; //20

    private BookDetail bookDetail;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public BookDetail getBookDetail() {
        return bookDetail;
    }

    public void setBookDetail(BookDetail bookDetail) {
        this.bookDetail = bookDetail;
    }

    @Override
    public String toString() {
        return "BookInfo{" +
                "id='" + id + '\'' +
                ", bookName='" + bookName + '\'' +
                ", category='" + category + '\'' +
                ", author='" + author + '\'' +
                ", publisher='" + publisher + '\'' +
                ", bookDetail=" + bookDetail +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BookInfo bookInfo = (BookInfo) o;
        return Objects.equals(id, bookInfo.id) &&
                Objects.equals(bookName, bookInfo.bookName) &&
                Objects.equals(category, bookInfo.category) &&
                Objects.equals(author, bookInfo.author) &&
                Objects.equals(publisher, bookInfo.publisher) &&
                Objects.equals(bookDetail, bookInfo.bookDetail);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, bookName, category, author, publisher, bookDetail);
    }
}
