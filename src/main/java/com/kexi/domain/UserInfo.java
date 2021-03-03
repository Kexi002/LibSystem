package com.kexi.domain;

import java.util.Objects;

public class UserInfo {
    private String id;
    private String realName; //15

    private Account account;
    private UserDetail userDetail;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
                ", realName='" + realName + '\'' +
                ", account=" + account +
                ", userDetail=" + userDetail +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserInfo userInfo = (UserInfo) o;
        return Objects.equals(id, userInfo.id) &&
                Objects.equals(realName, userInfo.realName) &&
                Objects.equals(account, userInfo.account) &&
                Objects.equals(userDetail, userInfo.userDetail);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, realName, account, userDetail);
    }
}
