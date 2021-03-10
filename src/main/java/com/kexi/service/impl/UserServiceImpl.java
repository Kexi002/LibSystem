package com.kexi.service.impl;

import com.github.pagehelper.PageHelper;
import com.kexi.dao.AccountDao;
import com.kexi.dao.BorrowDao;
import com.kexi.dao.UserDetailDao;
import com.kexi.dao.UserInfoDao;
import com.kexi.domain.*;
import com.kexi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private AccountDao accountDao;
    @Autowired
    private UserInfoDao userInfoDao;
    @Autowired
    private UserDetailDao userDetailDao;
    @Autowired
    private BorrowDao borrowDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    //添加方法在AccountService中，因为跟账号和详情是同步的
    //注意：页面要确认未注册且格式正确才能注册
    @Override
    public void register(UserInfo userInfo) {
        userInfo.getAccount().setPassword(bCryptPasswordEncoder.encode(userInfo.getAccount().getPassword()));
        if (userInfo.getAccount().getAuthority() != 1){
            userInfo.getAccount().setAuthority(0);
        }
        accountDao.save(userInfo.getAccount());
        userDetailDao.save(userInfo.getUserDetail());
        userInfoDao.save(userInfo);
    }

    @Override
    public UserInfo findById(String id) {
        return userInfoDao.findById(id);
    }

    @Override
    public UserInfo findByAccountId(String id) {
        return userInfoDao.findByAccountId(id);
    }

    @Override
    public List<UserInfo> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        return userInfoDao.findAll();
    }

    @Override
    public List<UserInfo> findByCondition(int page, int size, String condition) {
        List<UserInfo> userList = new ArrayList<>();
        String[] cs = condition.split("\\s+");
        List<Account> accountTempList1;
        List<Account> accountTempList2;
        List<UserInfo> tempList1;
        List<UserInfo> tempList2;
        for (String c : cs) {
            //两种情况：关键字是纯数字（可能匹配学号和用户名），或者非纯数字（可能匹配用户名和人名）
            if (!c.matches("^\\d+$")){
                //如果不是纯数字，则可能是人名或者用户名
                tempList1 = userInfoDao.findByRealNameLike(c);
                accountTempList2 = accountDao.findByUsernameLike(c);
                tempList2 = new ArrayList<>();
                for (Account account : accountTempList2) {
                    tempList2.add(userInfoDao.findByAccountId(account.getId()));
                }
                tempList2.removeAll(tempList1);
                tempList1.addAll(tempList2);
                if (!tempList1.isEmpty()){
                    if (!userList.isEmpty()){
                        userList.retainAll(tempList1);
                    }else {
                        userList = tempList1;
                    }
                }
            }else{
                //如果是纯数字，则两个字段都要查询，结果取并集，并把并集结果再跟原有列表retainAll
                //两个插叙结果取并集
                //因为两个字段都在account中，所以要先转成userinfo
                accountTempList1 = accountDao.findByStudentIdLike(c);
                accountTempList2 = accountDao.findByUsernameLike(c);
                tempList1 = new ArrayList<>();
                tempList2 = new ArrayList<>();
                for (Account account : accountTempList1) {
                    tempList1.add(userInfoDao.findByAccountId(account.getId()));
                }
                for (Account account : accountTempList2) {
                    tempList2.add(userInfoDao.findByAccountId(account.getId()));
                }
                tempList2.removeAll(tempList1);
                tempList1.addAll(tempList2);
                if (!tempList1.isEmpty()){
                    if (!userList.isEmpty()){
                        userList.retainAll(tempList1);
                    }else {
                        userList = tempList1;
                    }
                }
            }
        }
        return userList;
    }

    @Override
    public void update(UserInfo userInfo) {
        userDetailDao.update(userInfo.getUserDetail());
        userInfoDao.update(userInfo);
    }

    //注意：删除时要先删除用户再删除账号和详情
    @Override
    public void delete(String id) {

        //删除相关的借阅
        List<Borrow> borrowList = borrowDao.findByUserInfoId(id);
        for (Borrow borrow : borrowList) {
            borrowDao.delete(borrow.getId());
        }
        //删除用户，先删info再删除account和detail否则删不掉
        //但是要先把account和detail的id拿到！！！！
        UserInfo userInfo = userInfoDao.findById(id);
        String accountId = userInfo.getAccount().getId();
        String userDetailId = userInfo.getUserDetail().getId();
        System.out.println("1");
        accountDao.delete(accountId);
        userDetailDao.delete(userDetailId);
    }
}
