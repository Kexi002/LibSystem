package com.kexi.dao;

import com.kexi.domain.Account;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountDao {

    @Insert("insert into account (studentId,username,password,authority) values(#{studentId}, #{username}, #{password}, #{authority})")
    @SelectKey(keyColumn = "id",keyProperty = "id",before = false,resultType =String.class,statement = {" select last_insert_id()"})
    void save(Account account);

    @Select("select * from account")
    List<Account> findAll();

    //UserInfo获取Account对象
    @Select("select * from account where id = #{id}")
    Account findById(String id);

    //登录要用用户名或者学号查询
    @Select("select * from account where username = #{username}")
    Account findByUsername(String username);

    @Select("select * from account where username like concat('%',#{username},'%')")
    Account findByUsernameLike(String username);

    @Select("select * from account where studentId = #{studentId}")
    Account findByStudentId(String studentId);

    @Select("select * from account where studentId like concat('%',#{studentId},'%')")
    Account findByStudentIdLike(String studentId);

    @Update("update account set studentId = #{studentId}, username = #{username}, password = #{password} where id = #{id}")
    void update(Account account);

    @Update("update account set password = #{password} where id = #{id}")
    void updatePassword(Account account);

    //删除不知道应该依据哪个字段删？
    @Delete("delete from account where id = #{id}")
    void deleteById(String id);

/*    @Delete("delete from account where username = #{username}")
    void deleteByUsername(String username);*/

}
