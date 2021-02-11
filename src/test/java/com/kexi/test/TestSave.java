package com.kexi.test;

import com.kexi.dao.AccountDao;
import com.kexi.domain.Account;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 *
 配置spring和junit整合，junit启动时加载springIOC容器
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration("classpath:applicationContext.xml")
public class TestSave {

/*    @Autowired
    private AccountDao accountDao;*/

    @Test
    public void test1(){
        Account account = new Account();
        account.setUsername("test");
        account.setStudentId("123456");
        account.setAuthority(0);
/*        accountDao.save(account);*/
        System.out.println(account);
    }
}
