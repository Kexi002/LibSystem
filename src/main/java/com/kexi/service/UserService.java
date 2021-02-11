package com.kexi.service;

import com.kexi.domain.UserDetail;
import com.kexi.domain.UserInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserService {

    List<UserInfo> findAll();

    List<UserInfo> findByStudentIdLike(String studentId);

    List<UserInfo> findByRealNameLike(String realName);

    void update(UserInfo userInfo);

    void deleteById(String id);

}
