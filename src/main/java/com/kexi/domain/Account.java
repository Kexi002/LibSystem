package com.kexi.domain;

import java.util.Objects;

public class Account { //管理员只有Account，没有对应的User对象
    private String id;
    private String studentId; //15
    private String username; //10
    private String password; //20
    private Integer authority; //int,0 or 1
    private String authorityStr;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAuthority() {
        return authority;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    public String getAuthorityStr() {
        if(authority != null){
            if (authority == 0){
                authorityStr = "ROLE_USER";
            }else if (authority == 1){
                authorityStr = "ROLE_ADMIN";
            }
        }
        return authorityStr;
    }

    public void setAuthorityStr(String authorityStr) {
        this.authorityStr = authorityStr;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id='" + id + '\'' +
                ", studentId='" + studentId + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", authority=" + authority +
                ", authorityStr='" + authorityStr + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Account account = (Account) o;
        return id.equals(account.id) &&
                studentId.equals(account.studentId) &&
                username.equals(account.username) &&
                password.equals(account.password) &&
                authority.equals(account.authority) &&
                Objects.equals(authorityStr, account.authorityStr);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, studentId, username, password, authority, authorityStr);
    }
}
