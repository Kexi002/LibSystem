package com.kexi.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Objects;

public class Borrow {
    String id;

    UserInfo userInfo;
    BookInfo bookInfo;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Timestamp borrowDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Timestamp returnDate;
    Integer renew; //int, 0 or 1
    String renewStr;
    Integer status;
    String statusStr;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public BookInfo getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(BookInfo bookInfo) {
        this.bookInfo = bookInfo;
    }

    public Timestamp getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(Timestamp borrowDate) {
        this.borrowDate = borrowDate;
    }

    public Timestamp getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Timestamp returnDate) {
        this.returnDate = returnDate;
    }

    public Integer getRenew() {
        return renew;
    }

    public void setRenew(Integer renew) {
        this.renew = renew;
    }

    public String getRenewStr() {
        if(renew == 0){
            renewStr = "未续借";
        } else if(renew == 1){
            renewStr = "已续借";
        }
        return renewStr;
    }

    public void setRenewStr(String renewStr) {
        this.renewStr = renewStr;
    }

    public Integer getStatus() {
        long days = (System.currentTimeMillis() - returnDate.getTime()) / (1000 * 24 * 3600);
        if (days <= 0 ){
            //未超时
            if (renew == 0){
                status = 0;
            }else {
                status = 1;
            }
        }else {
            if (renew == 0){
                status = 2;
            }else {
                status = 3;
            }
        }
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStatusStr() {
        long days = (System.currentTimeMillis() - returnDate.getTime()) / (1000 * 24 * 3600);
        if (days <= 0 ){
            if (renew == 0){
                statusStr = "未逾期，可续借";
            }else {
                statusStr = "未逾期，已续借";
            }
        }else {
            if (renew == 0){
                statusStr = "已逾期，可续借";
            }else {
                statusStr = "已逾期，已续借";
            }
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }

    @Override
    public String toString() {
        return "Borrow{" +
                "id='" + id + '\'' +
                ", userInfo=" + userInfo +
                ", bookInfo=" + bookInfo +
                ", borrowDate=" + borrowDate +
                ", returnDate=" + returnDate +
                ", renew=" + renew +
                ", renewStr='" + renewStr + '\'' +
                ", status=" + status +
                ", statusStr='" + statusStr + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Borrow borrow = (Borrow) o;
        return Objects.equals(id, borrow.id) &&
                Objects.equals(userInfo, borrow.userInfo) &&
                Objects.equals(bookInfo, borrow.bookInfo) &&
                Objects.equals(borrowDate, borrow.borrowDate) &&
                Objects.equals(returnDate, borrow.returnDate) &&
                Objects.equals(renew, borrow.renew);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, userInfo, bookInfo, borrowDate, returnDate, renew);
    }
}
