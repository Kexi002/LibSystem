package com.kexi.domain;

import java.util.Objects;

public class BookInfo {
    private String id;
    private String bookName; //20
    private String category; //20
    private String categoryStr;
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

    public String getCategoryStr() {
        switch (category){
            case "A":
                categoryStr = "马克思主义、列宁主义、毛泽东思想、邓小平理论";
                break;
            case "B":
                categoryStr = "哲学、宗教";
                break;
            case "C":
                categoryStr = "社会科学总论";
                break;
            case "D":
                categoryStr = "政治、法律";
                break;
            case "E":
                categoryStr = "军事";
                break;
            case "F":
                categoryStr = "经济";
                break;
            case "G":
                categoryStr = "文化、科学、教育、体育";
                break;
            case "H":
                categoryStr = "语言、文字";
                break;
            case "I":
                categoryStr = "文学";
                break;
            case "J":
                categoryStr = "艺术";
                break;
            case "K":
                categoryStr = "历史、地理";
                break;
            case "N":
                categoryStr = "自然科学总论";
                break;
            case "O":
                categoryStr = "数理科学和化学";
                break;
            case "P":
                categoryStr =  "天文学、地球科学";
                break;
            case "Q":
                categoryStr =  "生物科学";
                break;
            case "R":
                categoryStr =  "医药、卫生";
                break;
            case "S":
                categoryStr =  "农业科学";
                break;
            case "T":
                categoryStr =  "工业技术";
                break;
            case "U":
                categoryStr =  "交通运输";
                break;
            case "V":
                categoryStr =  "航空、航天";
                break;
            case "X":
                categoryStr =  "环境科学、劳动保护科学（安全科学）";
                break;
            case "Z":
                categoryStr =  "综合性图书）";
                break;
        }
        return categoryStr;
    }

    public void setCategoryStr(String categoryStr) {
        this.categoryStr = categoryStr;
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
