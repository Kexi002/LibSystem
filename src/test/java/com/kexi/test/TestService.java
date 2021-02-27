package com.kexi.test;

import com.kexi.domain.*;
import com.kexi.service.AccountService;
import com.kexi.service.BookService;
import com.kexi.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.awt.print.Book;
import java.math.BigInteger;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:spring-security.xml"})
public class TestService {

    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Test
    public void addTestUser(){
        int start = 6;
        int end = 20;
        for (int i = start; i <= end; i++) {
            Account account = new Account();
            //account.setStudentId("222017321102033");
            String studentId = String.valueOf(100000000000000L + i);
            account.setStudentId(studentId);
            account.setUsername("test" + i);
            account.setPassword("123");
            account.setAuthority(0);

            UserDetail userDetail = new UserDetail();
            String phoneNum = String.valueOf(13800000000L + i);
            userDetail.setPhoneNum(phoneNum);
            userDetail.setEmail("test" + i + "@qq.com");
            userDetail.setGender("男");

            UserInfo userInfo = new UserInfo();
            userInfo.setStudentId(studentId);
            userInfo.setRealName("测试用户" + i);
            userInfo.setAccount(account);
            userInfo.setUserDetail(userDetail);

            accountService.register(userInfo);
        }
    }

    @Test
    public void addTestBook(){
        int start = 1;
        int end = 20;
        for (int i = start; i <= end; i++) {

            BookDetail bookDetail = new BookDetail();
            bookDetail.setPublicationDate("2021-2-27");
            bookDetail.setISBN("ISBN 0-000-00000-0");
            //198字
            bookDetail.setIntro("这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本这是书籍介绍的测试文本");
            bookDetail.setLocation("中心图书馆 某层 某书架");

            BookInfo bookInfo = new BookInfo();
            bookInfo.setBookDetail(bookDetail);
            bookInfo.setAuthor("测试作者"+i);
            bookInfo.setBookName("测试图书"+i);
            bookInfo.setCategory("T工业技术");
            bookInfo.setPublisher("测试出版社"+i);

            bookService.save(bookInfo);
        }
    }

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
