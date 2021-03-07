package com.kexi.dao;

import com.kexi.domain.UserDetail;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDetailDao {

    @Insert("insert into userDetail(gender, phoneNum, email) values(#{gender}, #{phoneNum}, #{email})")
    @SelectKey(keyColumn = "id",keyProperty = "id",before = false,resultType =String.class,statement = {" select last_insert_id()"})
    void save(UserDetail userDetail);

    @Select("select * from userDetail where id = #{id}")
    UserDetail findById(String id);

    @Update("update userDetail set gender = #{gender}, phoneNum = #{phoneNum}, email = #{email} where id = #{id}")
    void update(UserDetail userDetail);

    @Delete("delete from userDetail where id = #{id}")
    void delete(String id);
}
