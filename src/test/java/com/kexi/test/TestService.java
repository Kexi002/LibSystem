package com.kexi.test;

import com.kexi.domain.Account;
import com.kexi.domain.UserDetail;
import com.kexi.domain.UserInfo;
import com.kexi.service.AccountService;
import com.kexi.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:spring-security.xml"})
public class TestService {

    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;

    @Test
    public void testUpdateAccount(){
        Account account = new Account();
        account.setId("8");
        account.setStudentId("222017321102035");
        account.setUsername("kexixi");
        account.setPassword("$2a$10$wODikeEWnDeRd6mTpJSpbuIGv8DZS0.Vk1DwhMuWvMisHH/4.jfG.");
        accountService.update(account);
    }

    @Test
    public void testUpdateUser(){
        UserInfo userInfo = new UserInfo();
        userInfo.setId("2");
        userInfo.setStudentId("222017321102033");
        userInfo.setRealName("张可");

        Account account = new Account();
        account.setId("8");
        account.setStudentId("222017321102033");
        account.setUsername("kexizhang");
        account.setPassword("$2a$10$wODikeEWnDeRd6mTpJSpbuIGv8DZS0.Vk1DwhMuWvMisHH/4.jfG.");

        UserDetail userDetail = new UserDetail();
        userDetail.setId("2");
        userDetail.setGender("男");
        userDetail.setPhoneNum("15217920100");
        userDetail.setEmail("870977607@qq.com");

        userInfo.setAccount(account);
        userInfo.setUserDetail(userDetail);

        if(accountService.update(account)){
            System.out.println("账号更新完毕");
            userService.update(userInfo);
        }


    }

}
