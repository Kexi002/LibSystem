package com.kexi.dao;

import com.kexi.domain.Account;
import com.kexi.domain.UserDetail;
import com.kexi.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserInfoDao {

    //注意：保存用户前要先保存账户和详情
    @Insert("insert into userInfo(realName, accountId, userDetailId) values(#{realName}, #{account.id}, #{userDetail.id})")
    @SelectKey(keyColumn = "id",keyProperty = "id",before = false,resultType = String.class, statement = {" select last_insert_id()"})
    void save(UserInfo userInfo);

    @Select("select * from userInfo")
    @Results(id = "userInfoMap", value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "realName", column = "realName"),
            @Result(property = "account", column = "accountId", javaType = Account.class, one = @One(select = "com.kexi.dao.AccountDao.findById")),
            @Result(property = "userDetail", column = "userDetailId", javaType = UserDetail.class, one = @One(select = "com.kexi.dao.UserDetailDao.findById"))
    })
    List<UserInfo> findAll();

    //提供给Borrow的按id查询
    @Select("select * from userInfo where id = #{id}")
    @ResultMap("userInfoMap")
    UserInfo findById(String id);

    //按名字模糊查询
    @Select("select * from userInfo where realName like concat('%',#{realName},'%')")
    @ResultMap("userInfoMap")
    List<UserInfo> findByRealNameLike(String realName);

    @Select("select * from userInfo where accountId = #{accountId}")
    @ResultMap("userInfoMap")
    UserInfo findByAccountId(String accountId);

    @Update("update userInfo set realName = #{realName} where id = #{id}")
    void update(UserInfo userInfo);

    //注意：删除时要先删除用户再删除账号和详情
    @Delete("delete from userInfo where id = #{id}")
    void delete(String id);

}
