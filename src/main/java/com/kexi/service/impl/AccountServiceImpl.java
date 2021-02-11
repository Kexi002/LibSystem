package com.kexi.service.impl;

import com.kexi.dao.AccountDao;
import com.kexi.dao.UserDetailDao;
import com.kexi.dao.UserInfoDao;
import com.kexi.domain.Account;
import com.kexi.domain.UserInfo;
import com.kexi.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("accountService")
@Transactional
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;
    @Autowired
    private UserInfoDao userInfoDao;
    @Autowired
    private UserDetailDao userDetailDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    //管理员注册就用这个方法，因为没有用户对象
    public void save(Account account) throws Exception {
        //对密码进行加密处理
        account.setPassword(bCryptPasswordEncoder.encode(account.getPassword()));
        accountDao.save(account);
    }

    //注意：页面要确认未注册且格式正确才能注册
    @Override
    public void register(UserInfo userInfo) {
        userInfo.getAccount().setPassword(bCryptPasswordEncoder.encode(userInfo.getAccount().getPassword()));
        userInfo.getAccount().setAuthority(0);
        accountDao.save(userInfo.getAccount());
        userDetailDao.save(userInfo.getUserDetail());
        userInfoDao.save(userInfo);
    }

    @Override
    public List<Account> findAll() {
        return accountDao.findAll();
    }

    @Override
    public Account findByUsername(String username) {
        return accountDao.findByUsername(username);
    }

    @Override
    public Account findByStudentId(String studentId) {
        return accountDao.findByStudentId(studentId);
    }

    @Override
    public boolean update(Account account) {
        Account tempAccount = accountDao.findByStudentId(account.getStudentId());
        //如果不为空，说明存在这个学号的account，要么是本人要么是别人
        if (tempAccount != null){
            //如果不是本人，说明已经被占用了，更改失败
            if(!tempAccount.getId().equals(account.getId())){
                System.out.println("此学号已经被占用了");
                return false;
            }
        }
        tempAccount = accountDao.findByUsername(account.getUsername());
        if (tempAccount != null){
            if(!tempAccount.getId().equals(account.getId())){
                System.out.println("此用户名已经被占用了");
                return false;
            }
        }
        //学号和用户名都没被占用，可以更改
        accountDao.update(account);
        return true;
    }

    @Override
    public void updatePassword(Account account) {
        accountDao.updatePassword(account);
    }


    @Override
    public UserDetails loadUserByUsername(String username){
        //用户名或学号登录，这里的username是用户名或学号
        System.out.println("正在找用户的登录账号.....");
        Account account = null;
        User user = null;
        account = accountDao.findByUsername(username);
        if (account != null){
            System.out.println("用户名登录.....");
            //处理自己的用户对象封装成UserDetails
            ArrayList<SimpleGrantedAuthority> list = new ArrayList<>();
            list.add(new SimpleGrantedAuthority(account.getAuthorityStr()));
            user = new User(account.getUsername(),account.getPassword(), true,
                    true, true, true,list);
        } else{
            account = accountDao.findByStudentId(username);
            if (account != null){
                System.out.println("学号登录.....");
                ArrayList<SimpleGrantedAuthority> list = new ArrayList<>();
                list.add(new SimpleGrantedAuthority(account.getAuthorityStr()));
                user = new User(account.getStudentId(),account.getPassword(), true,
                        true, true, true,list);
            }else{
                System.out.println("验证失败，找不到账号.....");
            }
        }
        return user;
    }
}