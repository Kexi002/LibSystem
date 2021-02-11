package com.kexi.service.impl;

import com.kexi.dao.AccountDao;
import com.kexi.dao.UserDetailDao;
import com.kexi.dao.UserInfoDao;
import com.kexi.domain.UserDetail;
import com.kexi.domain.UserInfo;
import com.kexi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserInfoDao userInfoDao;
    @Autowired
    private UserDetailDao userDetailDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    //添加方法在AccountService中，因为跟账号和详情是同步的

    @Override
    public List<UserInfo> findAll() {
        return userInfoDao.findAll();
    }

    @Override
    public List<UserInfo> findByStudentIdLike(String studentId) {
        return userInfoDao.findByStudentIdLike(studentId);
    }

    @Override
    public List<UserInfo> findByRealNameLike(String realName) {
        return userInfoDao.findByRealNameLike(realName);
    }

    //注意：更新用户的时候要先调用account的更新账户，然后看结果
    @Override
    public void update(UserInfo userInfo) {
        userInfoDao.update(userInfo);
        userDetailDao.update(userInfo.getUserDetail());
    }

    //注意：删除时要先删除用户再删除账号和详情
    @Override
    public void deleteById(String id) {

    }
}
