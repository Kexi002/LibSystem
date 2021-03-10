package com.kexi.service;

import com.kexi.domain.UserDetail;
import com.kexi.domain.UserInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserService {
    void register(UserInfo userInfo);

    UserInfo findById(String id);

    UserInfo findByAccountId(String id);

    List<UserInfo> findAll(int page, int size);

    List<UserInfo> findByCondition(int page, int size, String condition);

    void update(UserInfo userInfo);

    void delete(String id);

}
