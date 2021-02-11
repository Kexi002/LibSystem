package com.kexi.domain;

public class UserInfo {
    private String id;
    private String studentId; //15
    private String realName; //15

    private Account account;
    private UserDetail userDetail;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public UserDetail getUserDetail() {
        return userDetail;
    }

    public void setUserDetail(UserDetail userDetail) {
        this.userDetail = userDetail;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id='" + id + '\'' +
                ", studentId='" + studentId + '\'' +
                ", realName='" + realName + '\'' +
                ", account=" + account + '\'' +
                ", userDetail=" + userDetail +
                '}';
    }
}
