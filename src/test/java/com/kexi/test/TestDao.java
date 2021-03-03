package com.kexi.test;

import com.kexi.dao.AccountDao;
import com.kexi.dao.BookDetailDao;
import com.kexi.dao.BorrowDao;
import com.kexi.dao.UserInfoDao;
import com.kexi.domain.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.InputStream;
import java.sql.Timestamp;
import java.util.List;

public class TestDao {
    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession session;
    private UserInfoDao userInfoDao;
    private AccountDao accountDao;
    private BookDetailDao bookDetailDao;
    private BorrowDao borrowDao;

    @Before
    public void init()throws Exception{
        in = Resources.getResourceAsStream("SqlMapConfig.xml");
        factory = new SqlSessionFactoryBuilder().build(in);
        session = factory.openSession();
        userInfoDao = session.getMapper(UserInfoDao.class);
        accountDao = session.getMapper(AccountDao.class);
        borrowDao = session.getMapper(BorrowDao.class);
    }

    @After
    public void destroy()throws  Exception{
        session.commit();
        session.close();
        in.close();
    }

    @Test
    public void testUserInfoFindAll(){
        List<UserInfo> users = userInfoDao.findAll();
        System.out.println("每个用户的userInfo");
        for (UserInfo user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void testUserInfoFindByRealName(){
        //List<UserInfo> users = userInfoDao.findByRealName("张可");
        List<UserInfo> users = userInfoDao.findByRealNameLike("张");
        System.out.println("按名字查询userInfo");
        for (UserInfo user : users) {
            System.out.println(user);
        }
    }

/*    @Test
    public void testUserInfoFindByStudentId(){
        List<UserInfo> users = userInfoDao.findByStudentIdLike("03");
        System.out.println("按学号查询userInfo");
        for (UserInfo user : users) {
            System.out.println(user);
        }
    }*/

    @Test
    public void testBorrowInsert(){
        Borrow borrow = new Borrow();

        BookInfo bookInfo = new BookInfo();
        bookInfo.setId("1");
        UserInfo userInfo = new UserInfo();
        userInfo.setId("2");

        borrow.setBookInfo(bookInfo);
        borrow.setUserInfo(userInfo);
        borrow.setReturnDate(new Timestamp(System.currentTimeMillis()));

        borrowDao.save(borrow);
        System.out.println(borrow);
    }

    @Test
    public void testBorrowFindAll(){
        List<Borrow> list = borrowDao.findAll();
        for (Borrow borrow : list) {
            System.out.println(borrow);
        }
    }

    @Test
    public void testDelete(){
        accountDao.delete("11");
    }



/*    @Test
    public void testFindOne(){
        User user = userDao.findById(57);
        System.out.println(user);
    }


    @Test
    public  void testFindByName(){
        List<User> users = userDao.findUserByName("%mybatis%");
        for(User user : users){
            System.out.println(user);
        }
    }*/
}
